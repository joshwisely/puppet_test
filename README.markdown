Tech challange for Puppet.

#Setup Instructions
1. Install
	1. Automated Install
		1. wget https://github.com/joshwisely/puppet_test/archive/v0.0.2.tar.gz -O ./joshwisely-test_0.0.2.tar.gz
		2. puppet module install ./joshwisely-test_0.0.2.tar.gz
	2. Git Clone Install
		1. Install pre-reqs.
			`puppet module install jfryman/nginx`
			`puppet module install spiette/selinux`
			`puppet module install puppetlabs/vcsrepo`
		2. Clone repo to modules folder.
			`git clone https://github.com/joshwisely/puppet_test.git /etc/puppetlabs/code/environments/production/modules/test`
2. Create node group.
	1. Open Puppet console.
	2. Click `Nodes` in the left nav bar.
	3. Click `Classification` in the middle nav bar.
	4. Click `Add Group...`.
	5. Set the group name to `Test`.
	6. Click `Add`.
	7. Click the name of the newly created group in the list below.
	8. In the `Fact` box enter `name`.
	9. In the `Operator` box select `matches regex`.
	10. In the `Value` box enter `.*`.
	11. Click `Add rule`.
	12. Click `Commit 1 change`.
3. Add test class to newly created group.
	1. On the `Classification` page, click the newly created group.
	2. Click on the `Classes` tab.
	3. Type in `Test` in the box.
	4. Click `Add class`.
	5. Click `Commit 1 change`.
4. Run Puppet agent to apply changes.
	1. Wait for the next Puppet agent run.
	2. Or, run `puppet agent -t` to apply changes right now.