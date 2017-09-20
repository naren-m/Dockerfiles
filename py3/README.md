## Python3.5.2 Dockerfile

Built on [narenm/dev-env](https://github.com/naren-m/Dockerfiles/tree/master/dev-env)

Python version 3.5.2


Building docker

    cd python3.5
    docker build -t narenm/python3 .
    
Running python3 docker

    docker run -it narenm/python3
    
    or 
    
    docker run -it narenm/python3 bash
    
    or 
    
    docker run -it narenm/python3 zsh
    

## References

[Python installation instructions](http://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get)

    sudo add-apt-repository ppa:jonathonf/python-3.6
    sudo apt-get update
    sudo apt-get install python3.6
    
    or 
    
    sudo add-apt-repository ppa:fkrull/deadsnakes
    sudo apt-get update
    sudo apt-get install python3.6
