Tech challange for Puppet.

#Assumptions
- This will run on CentOS 7.
- There is internet access to pull down and install code.

#Setup Instructions
- Install
	- Automated Install
	
			wget https://github.com/joshwisely/puppet_test/archive/v0.0.2.tar.gz -O ./joshwisely-test_0.0.2.tar.gz
			puppet module install ./joshwisely-test_0.0.2.tar.gz
			
	- Git Clone Install
		- Install pre-reqs.
		
				puppet module install jfryman/nginx
				puppet module install spiette/selinux
				puppet module install puppetlabs/vcsrepo
				
		- Clone repo to modules folder.
			
				git clone https://github.com/joshwisely/puppet_test.git /etc/puppetlabs/code/environments/production/modules/test
				
- Create node group.
	- Open Puppet console.
	- Click `Nodes` in the left nav bar.
	- Click `Classification` in the middle nav bar.
	- Click `Add Group...`.
	- Set the group name to `Test`.
	- Click `Add`.
	- Click the name of the newly created group in the list below.
	- In the `Fact` box enter `name`.
	- In the `Operator` box select `matches regex`.
	- In the `Value` box enter `.*`.
	- Click `Add rule`.
	- Click `Commit 1 change`.
- Add the test class to newly created group.
	- On the `Classification` page, click the newly created group.
	- Click on the `Classes` tab.
	- Type in `Test` in the box.
	- Click `Add class`.
	- Click `Commit 1 change`.
- Run Puppet agent to apply changes.
	- Wait for the next Puppet agent run.
	- Or, run `puppet agent -t` to apply changes right now.
