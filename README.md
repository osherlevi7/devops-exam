## Deb package from scratch 

  

All the packages file follow the specific convention -

[name]_[version]-[revision]_[architecture].deb

  

*  name ==   the name of your application;
*  version == the version number of your application;
*  revision == the version number of the current deb package;
*  architecture == the hardware architecture your program will be run on.


## Creating the deb directory
### Create a  directory to make your package in.

     $ mkdir myProject_1.0-1_amd64 

#### Put your program files where they should be installed to on the target system.

 

    $ mkdir -p myProject_1.0-1_amd64/usr/local/bin

> The -p flag to the mkdir command will create nested directories

  
### Copy the project to the nested directory.

    $ cp ~/YourProjects/Hello/hello myProject_1.0-1_amd64 /usr/local/bin

  
  

### Create the DEBIAN dir && the control file.

    $ mkdir myProject_1.0-1_amd64 /DEBIAN
    $ touch myProject_1.0-1_amd64/DEBIAN/control


### Configure the control file

* Package – the name of your program

* Version – the version of your program

* Architecture – the target architecture

* Maintainer – the name and the email address of the person in charge of the package maintenance

* Description – a brief description of the program.

***EXAMPLE*** 

> Package: myProject 
> Version: 1.0 
> Architecture: amd64 
> Maintainer:Internal Pointers <info@internalpointers.com>
>  Description: A program that greets you. You can add a longer description here. Mind the space at the beginning of this paragraph.

  

The control file may contain additional useful fields such as the **section** it belongs to or the dependency list. The latter is extremely important in case your program relies on external libraries to work correctly.
 You can fill it manually if you wish, but there are helper tools to ease the burden. 
 

  

### Build the deb package - use the dpkg utility.

    $ dpkg-deb --build --root-owner-group <myProject_1.0-1_amd64>

### Teat your deb package, Install the deb package

     $ sudo dpkg -i <package>



## Deb package from Installer 

At this project directory you'll find a bash script called - installer.sh 
Run the installer and follow the prompt dialog with bash. 

    $ ./installer.sh 
    Package-Name-For-Build[eg. devops-exam]: devops-exam
    Version to create[eg. - 1.0]: 1.0
    Revision to build[eg. - 1]: 1
    The target Architectore [eg. amd64]: amd64
    Maintainers: osher
    Description of your package: some description
    
    
 Inside the project you can find the new folder for build and install you package.
 
### To build the package, run the commad: 

    $ dpkg-deb --build --root-owner-group devops-exam_1.0-1_amd64

### To install the package, run the commad: 

    $ sudo dpkg -i devops-exam_1.0-1_amd64
### To remove the package, run the command:

    $ sudo dpkg -r devops-exam_1.0-1_amd64
