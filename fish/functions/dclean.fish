function dclean -d "Clean up docker bullshit"
  echo "Killing all running containers"
  docker kill (docker ps -q) 2&> /dev/null
  echo "Removing all existing containers"
  docker rm (docker ps -a -q) -f 2&> /dev/null
  echo "Removing all existing images"
  docker rmi (docker images -a -q) -f 2&> /dev/null
  echo "Removing all existing volumes"
  docker volume rm (docker volume ls -q) -f 2&> /dev/null
  echo "Removing all existing networks"
  docker network prune -f 2&> /dev/null
  echo "Clearing build cache"
  docker builder prune -af 2&> /dev/null
  echo "Done"
end