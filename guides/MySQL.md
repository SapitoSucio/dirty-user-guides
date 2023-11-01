rAthena supports both MariaDB and MySQL, and the selection between these two database systems depends on various factors. While both databases are compatible with rAthena, differences exist that should be considered:

| Feature                   | MariaDB                              | MySQL                                |
|---------------------------|--------------------------------------|---------------------------------------|
| **Compatibility with rAthena** | Compatible                         | Compatible                            |
| **Performance**            | Generally faster, especially on complex queries; Additional storage engines (Aria, TokuDB, MyRocks) may provide advantages | Good performance; Performance may vary with storage engines and configurations |
| **Licensing**              | GPL with MariaDB License            | GPL (Open Source)                     |
| **Replication**            | Galera Cluster for synchronous multi-master replication | MySQL Replication with semi-synchronous and asynchronous options |
| **Community & Support**    | Community-driven, with enterprise support from MariaDB Corporation | Developed by MySQL AB (now Oracle) with enterprise support available |

You can choose either MariaDB or MySQL based on your specific requirements, performance needs, and licensing considerations. Both databases should work well, it's up to you 🐸👌

<br>

=== "MariaDB"
	<br>
	# Installing MariaDB on Windows

	MariaDB is a popular open-source relational database management system. Follow the steps below to install MariaDB on Windows.

	## Step 1: Download the MariaDB Installer

	1. Visit the official MariaDB website at [https://mariadb.org/](https://mariadb.org/) and navigate to the "Downloads" section.
	2. Choose the appropriate version of MariaDB for Windows and click on the download link to start the download.

	<figure markdown>
	![MariaDB Download Page](https://images.weserv.nl/?url=https://i.imgur.com/X6jEXDH.png?v=4&&maxage=7d&l=6)
	<figcaption>MariaDB Download Page</figcaption>
	</figure>

	## Step 2: Run MariaDB Installer

	3. Once the installer is downloaded, locate the file and double-click on it to run the installer.
	4. You may be prompted by Windows to confirm the installation. Click "Yes" to proceed.
	5. Accept the terms of License Agreement.
	6. You will be prompted to choose the features you want to install.
	7. Once you choose the features you want to install, click "Next" to continue.

	<figure markdown>
	![MariaDB Installer](https://images.weserv.nl/?url=https://i.imgur.com/D0vfGJM.png?v=4&&maxage=7d&l=6)
	<figcaption>MariaDB Installer</figcaption>
	</figure>

	## Step 3: Change User Settings

	8. Tick the "Modify password for the database user "root" and change the password.
	9. Click "Next" to continue.

	<figure markdown>
	![Change User Settings](https://images.weserv.nl/?url=https://i.imgur.com/JxOrEnf.png?v=4&&maxage=7d&l=6)
	<figcaption>Change User Settings</figcaption>
	</figure>

	## Step 4: Database Settings

	10. You can configure other options like the service name and port number if desired.
	11. Click on "Next" to continue.

	<figure markdown>
	![Database Settings](https://images.weserv.nl/?url=https://i.imgur.com/9sosc8G.png?v=4&&maxage=7d&l=6)
	<figcaption>Database Settings</figcaption>
	</figure>

	## Step 5: Ready to Install

	12. Reached this point, the installation will start.

	<figure markdown>
	![Ready to Install](https://images.weserv.nl/?url=https://i.imgur.com/hYzatQr.png?v=4&&maxage=7d&l=6)
	<figcaption>Ready to Install</figcaption>
	</figure>

	## Step 6: Complete the Installation

	13. Once the installation is complete, you will see a "Installation Complete" message.
	14. Click "Finish" to exit the installer.

	## Step 8: Verify the Installation

	15. Search for Mysql Client and run it.
	16. You will be prompted to enter the root password you set during the installation.
	17. If the command-line client opens without any errors, it indicates that MariaDB is successfully installed on your Windows system.

	<figure markdown>
	![MariaDB Installer](https://images.weserv.nl/?url=https://i.imgur.com/p9UtjYi.png?v=4&&maxage=7d&l=6)
	<figcaption>Run Mysql Client</figcaption>
	</figure>

	Congratulations! You have successfully installed MariaDB on Windows. You can now start using MariaDB as your relational database management system.

	## Additional Notes

	- You can find documentation and resources for using MariaDB on the official MariaDB website.
	- Remember to secure your MariaDB installation by creating user accounts with appropriate privileges and configuring suitable security measures.
=== "MySQL"
	<br>
	# Installing MySQL on Windows