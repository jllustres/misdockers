if [ $# -ne 2 ]
then
	echo user pass
	exit 1
fi
USER=$1
PASS=$2
# Creamos nuestra imagen
# Ubicarse en dir de Dockerfile
docker build --build-arg https_proxy=http://$USER:$PASS@proxy:8080/ --build-arg http_proxy=http://$USER:$PASS@proxy:8080/ -t soasamba .

# Creamos IP's distintas para cada contenedor
# Ejemplo 10; se puede pedir
# Aquí son 10 para el interfaz enp0s8, pero pueden repartirse
for ((i=5;i<10;i++)); do sudo ip addr add 192.168.56.$i dev enp0s8;done

# Ahora, iniciamos cada contenedor en su IP, con su propio nombre de red,
# su propio volumen y nombre de contenedor; queda por resolver el nombre DNS
for ((i=5;i<10;i++))
do 
	docker run -d -e  SRVSAMBA=SRV000$i -p 192.168.56.$i:137:137 -p 192.168.56.$i:138:138 -p 192.168.56.$i:139:139 -p 192.168.56.$i:445:445 -v /home/$USER/$i:/shared --name samba$i samba
done

####docker run -d -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445 -v /datos/ofimatica/:/shared_ofimatica -v /datos/negocio/:/shared_negocio -v /datos/control/:/shared_control soasamba
