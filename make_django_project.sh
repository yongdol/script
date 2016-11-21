#!/bin/bash
#폴더를 생성할 위치에서 실행
# sh <다운받은 make_django_project.sh 의 dir> <프로젝트이름> <pyenv이름>
project_dir=`pwd`
project_name=$1
pyenv_name=$2

mkdir $project_name
pyenv virtualenv 3.4.3 $pyenv_name
cd $project_name
pyenv local $pyenv_name
pip install django
pip freeze > requirements.txt
django-admin startproject $project_name
mv $project_name django_app

#복사할 gitignore의 위치를 자신의 환경에 맞게 변경해서 사용.
cp ~/project/django/instagram/.gitignore .

#pycharm 실행(macOS)
open -a /Applications/PyCharm\ CE.app/Contents/MacOS/pycharm $project_dir/$project_name
