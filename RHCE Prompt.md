I'm practicing for the RHCE. I need you to generate a mockup specification. The idea is simple, 4 roles with 2 nodes each, initially you must ask me to configure an official RHEL role for 2 of these nodes, after that 3 custom roles, which combined must cover at least but not more than once each of the following requests:

* Creation, modification, and deletion of GPT disk partitions.
* Configuration of LVM physical volumes, volume groups, and logical volumes.
* Extension of existing logical volumes.
* Addition and activation of system swap space.
* Formatting and deployment of VFAT, ext4, and XFS filesystems.
* Structural management (creation, copying, moving, deletion) of directories and files.
* Configuration of hard and soft symbolic links.
* Persistent filesystem mounting via UUID or label templates.
* Mounting and configuration of NFS network file systems, as a direct info for this one these are the contents of the /etc/exports at the host system. RHCE objectives make it implicit that you must configure nodes on the client side:
/opt/nfs/backup         192.168.122.0/24(rw,sync,no_subtree_check,no_root_squash)
/opt/nfs/home           192.168.122.0/24(rw,sync,no_subtree_check,no_root_squash)
* Configuration of `autofs` for on-demand target paths.
* Creation, deletion, and modification of local user accounts and groups.
* Assignment and management of group memberships.
* Enforcement of local account passwords and password aging parameters.
* Lockdown of standard ugo/rwx file permissions and ownership.
* Enforcement of default system-wide file permissions (`umask`).
* Definition of privileged administrative access (`sudoers` state).
* Correction and alignment of file permission anomalies.
* Allocation of static or dynamic IPv4 and IPv6 addresses.
* Configuration of local hostname resolution (`/etc/hosts`).
* Configuration of firewall zones, permanent services, and active port rules.
* System-wide enforcement of SELinux modes (`enforcing` or `permissive`).
* Alignment of system file and process SELinux context types.
* Restoration of default file context states.
* Configuration of SELinux port labels and Boolean flags.
* Configuration of default system boot targets (e.g., multi-user vs. graphical).
* Runtime enforcement of service states (`started`, `stopped`).
* Boot-time persistence configuration of network and system services (`enabled`).
* Chrony NTP client baseline configuration.
* Task scheduling via `cron` configurations or `systemd` timer units.
* Activation of specific system tuning profiles (`tuned`).
* Persistent storage and preservation configurations for system journals.
* Configuration of RPM and Flatpak repositories.
* Enforced installation, update, or removal of RPM and Flatpak software packages.
* Deployment of customized configuration files using templates.
* Management of system text files and standalone utility scripts.
* Archiving and unarchiving of compressed files (`.tar.gz`, `.bz2`).
* Modification and generation of the system bootloader configuration.

Across the generation of the specification you must also at least but not more than once each of the following methods/tools of ansible: 

- Variables & Command Registration (register)
- Facts
- Loops
- Conditional tasks
- Handlers
- Error Handling
- JJ2 Templates
- Content Collections

Pay attention to the wording. I'm not asking for a step by step guide, I want it to be an specification "Make these nodes, have this role, which has exactly this characteristics using this specific set of methods/tools from ansible" should be the tone you're aiming for. As stated before, if I look at the test and see this list, every single thing of the state-space list and the method/tools list is at least used once per mockup. 

Dont be abstract, be very very very specific. I dont want a "Use this tool however you see fit", I want a "Use this tool specifically for to achieve these very specific state" tone.  No answers, as stated, I want to read this as if you were handling me a spec doc and I was the engineer in charge of deploying it. Dont create a specific section for the method/tools, it should be seamlessly embedded in the blueprints for the roles. Make sure, as stated, you dont miss anything. Every tool/method must be used once, and every state bullet point must be demanded at least once. 