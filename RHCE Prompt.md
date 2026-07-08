# Role & Objective
You are an RHCE Exam Architect. Generate a production-grade deployment specification document for RHCE practice.

# Role Architecture
Organize the specification across exactly 3 Custom Ansible roles

# Target Lists
## State Space List
* Creation, modification, and deletion of GPT disk partitions.
* Configuration of LVM physical volumes, volume groups, and logical volumes.
* Extension of existing logical volumes.
* Addition and activation of system swap space.
* Formatting and deployment of VFAT, ext4, and XFS filesystems.
* Structural management (creation, copying, moving, deletion) of directories and files.
* Configuration of hard and soft symbolic links.
* Persistent filesystem mounting via UUID or label templates.
* Mounting and configuration of NFS network file systems at client side. These are the contents of the /etc/exports at the host system:
/opt/nfs/backup         192.168.122.0/24(rw,sync,no_subtree_check,no_root_squash)
/opt/nfs/home           192.168.122.0/24(rw,sync,no_subtree_check,no_root_squash)
* Configuration of `autofs` for on-demand target paths.
* Creation, deletion, and modification of local user accounts and groups.
* Managing secondary group memberships and supplementary user groups.
* Enforcement of local account passwords and password aging parameters.
* Lockdown of standard ugo/rwx file permissions and ownership.
* System-wide enforcement of default umask values across global environment files.
* Definition of privileged administrative access (`sudoers` state).
* Audit and remediation of non-compliant file mode permissions across target directory trees.
* Allocation of static or dynamic IPv4 and IPv6 addresses.
* Configuration of local hostname resolution (`/etc/hosts`).
* Configuration of firewall zones, permanent services, and active port rules.
* System-wide enforcement of SELinux modes (`enforcing` or `permissive`).
* Alignment of system file and directory SELinux context types.
* Restoration of default file context states.
* Configuration of SELinux port labels and Boolean flags.
* Configuration of default system boot targets (e.g., multi-user vs. graphical).
* Runtime enforcement of service states (`started`, `stopped`).
* Boot-time persistence configuration of network and system services (`enabled`).
* Chrony NTP client baseline configuration.
* Task scheduling via `cron` configurations or `systemd` timer units.
* Activation of specific system tuning profiles (`tuned`).
* Enforcement of non-volatile, persistent log storage within systemd-journald
* Configuration of Flatpak repositories.
* Enforced installation, update, or removal of RPM and Flatpak software packages.
* Declarative modification, line replacement, and block insertion of content within system text files.
* Archiving and unarchiving of compressed files (`.tar.gz`, `.bz2`).
* Modification of kernel boot parameters and regeneration of the GRUB configuration.

## Method/Tools List
- Ansible register and variables
- Facts
- Loops
- Conditional tasks
- Handlers
- Error Handling

# Strict Coverage & Integration Rules
1. **Frequency Rules:** Every individual item from BOTH lists above must be mandated at least once, but no more than twice, across the entire specification.
2. **Inline Integration:** Do NOT create a standalone "Tools" or "Methods" section. Embed every tool requirement directly into the target state descriptions using explicit pairing syntax (e.g., *"Achieve [Specific State from List 1] using [Specific Ansible Module/Method from List 2]"*). As you noticed the State Space List is larger. This implies that there will be many target states that will merely look like *"Achieve [Specific State from List 1]"*. This is perfectly fine. What's not fine is the opposite. Things from List 2 must never stand on it's own. 
3. **Exactness:** Do not use vague language like "configure networking." Use explicit requirements like "Enforce firewall port 80/tcp open" and "Archive contents of /var/temp into /root/temp_archive.tar.gz" INSTEAD OF things like "Enforce firewall rules" or "Archive and Unarchive a folder".

# Output Format & Tone
- **Tone:** Direct, authoritative engineering specification document handed to an engineer for execution.
- **Structure:** Clear node/role blueprints detailing requirements per role.

# Constraints
- **DO NOT** output any playbook code, YAML, solutions, or syntax examples.
- Be programatically specific. Remember the RHCE is evaluated by a robot. Things like "Use and error handling block" are not testable by a robot. Things like "Try A, if not B, but always C" are testable by a robot. I want a specification that looks exactly like the later. 