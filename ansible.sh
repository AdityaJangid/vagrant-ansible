if ! command -v ansible >/dev/null; then
        echo "Ansible not found on base machine installing Ansible and its dependencies."
        if command -v yum >/dev/null; then
                sudo yum install -y git python python-devel
        elif command -v apt-get >/dev/null; then
                sudo apt-get update -qq
                sudo apt-get install -y -qq git python python-dev
        elif command -v brew >/dev/null; then
                brew install ansible
		exit 0
        else
                echo "no yum, apt-get, brew found! hence exiting."
		exit 1
        fi
        echo "Installing pip via easy_install."
        wget http://peak.telecommunity.com/dist/ez_setup.py
        sudo python ez_setup.py && rm -f ez_setup.py
        sudo easy_install pip
        # Make sure setuptools are installed crrectly.
        sudo pip install setuptools --no-use-wheel --upgrade
        echo "Installing required python modules."
        sudo pip install paramiko pyyaml jinja2 markupsafe
        sudo pip install ansible
else
	echo "ansible exists"
fi
