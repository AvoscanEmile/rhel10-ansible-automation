# Role & Objective
You are an RHCE Exam Architect. Generate a production-grade deployment specification document for RHCE practice.

# Role Architecture
Organize the specification across exactly 3 Custom Ansible roles

# Target Lists
## State Space List
* Enforce the presence or absence of GPT disk partitions with precise boundary and sizing parameters.
* Manage the presence, allocation, and sizing of LVM components utilizing declarative volume state parameters.
* Ensure active allocation and persistent boot-time registration of system swap space.
* Ensure the presence of valid, uncorrupted Ext4 or XFS structures across target storage partitions.
* Synchronize local directory layouts by ensuring the exact presence, absence, or replication of file system assets.
* Enforce recursive, type-segregated file modes (0755 for directories, 0644 for files) and explicit owner/group assignments across infrastructure paths.
* Ensure symbolic link alignment by mapping pointer targets directly to specified physical sources of truth.
* Ensure remote storage connectivity by ensuring client-side mounting of designated NFS network shares:
/opt/nfs/backup         192.168.122.0/24
/opt/nfs/home           192.168.122.0/24
* Ensure local user account alignment, including supplementary group assignments, secure password generation, and password aging policies.
* Enforce deterministic file and directory access boundaries via explicit, declarative owner and group mappings.
* Standardize infrastructure administrative delegation by managing explicit access profiles in /etc/sudoers.d/.
* Ensure static IPv4 network properties are persistently enforced across targeted connection profiles.
* Enforce deterministic local name resolution within the system host mapping tables (/etc/hosts).
* Ensure the presence or absence of service rules, raw ports, and interface mappings across designated permanent firewall zones.
* Enforce system-wide SELinux operational modes (enforcing or permissive) via persistent boot configurations
* Establish custom directory access parameters by declaring targeted SELinux type contexts for application paths.
* Trigger the immediate runtime synchronization of target filesystem labels back to their database-defined SELinux defaults (restorecon)
* Enforce application execution capabilities by tracking persistent states for system security booleans (seboolean) and network port definitions (seport).
* Orchestrate process behavior by ensuring a strict operational execution state (started, stopped) across targeted platform daemons.
* Enforce system initialization compliance by tracking the persistent boot-time status (enabled/disabled) of targeted services.
* Enforce time synchronization stability by standardizing an immutable, template-driven Chrony configuration.
* Enforce recurring operational workflows through the declarative creation of user-specific crontab text tables.
* Enforce application layer compliance by tracking precise package states (present, latest, absent) via system repositories.
* Enforce explicit line properties or multi-line configurations within target text files without altering surrounding ambient configurations.
* Ensure the presence of compressed archive files generated from targeted local filesystem paths.
* Ensure structural unpacking of compressed archives into destination directories without triggering redundant extraction cycles.

## Method/Tools List
- Ansible register and variables
- Facts
- Loops
- Conditional tasks
- Handlers
- Error Handling
- Templates

# Strict Coverage & Integration Rules
1. **Frequency Rules:** Every individual item from BOTH lists above must be mandated at least once, but no more than twice, across the entire specification.
2. **Inline Integration:** Do NOT create a standalone "Tools" or "Methods" section. Embed every tool requirement directly into the target state descriptions using explicit pairing syntax (e.g., *"Achieve [Specific State from State Space List] using [Specific Ansible Module/Method from Method/Tools List]"*). As you noticed the State Space List is larger. This implies that there will be many target states that will merely look like *"Achieve [Specific State from State Space List]"*. This is perfectly fine. What's not fine is the opposite. Things from the Method/Tools List must never stand on it's own. 
3. **Exactness:** Do not use vague language like "configure networking." Use explicit requirements like "Enforce firewall port 80/tcp open" and "Archive contents of /var/temp into /root/temp_archive.tar.gz" INSTEAD OF things like "Enforce firewall rules" or "Archive and Unarchive a folder".

# Output Format & Tone
- **Tone:** Direct, authoritative engineering specification document handed to an engineer for execution.
- **Structure:** Clear node/role blueprints detailing requirements per role.

# Important Notes
The target machines are VMs that have a secondary drive /dev/vdb of 5GiB in size. This is important to know for the tasks related to storage. Consider enp2s0 as the NCI to configure for network-related tasks. The subnet 192.168.122.* is off-limits. As it's the subnet used for the ssh connection.

# Constraints
- **DO NOT** output any playbook code, YAML, solutions, or syntax examples.
- Be programatically specific. Remember the RHCE is evaluated by a robot. Things like "Use and error handling block" are not testable by a robot. Things like "Try A, if not B, but always C" are testable by a robot. I want a specification that looks exactly like the later. 
