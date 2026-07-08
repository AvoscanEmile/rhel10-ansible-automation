### Mockup Specification: "System Baseline Automation"

**Objective:**
The candidate must configure a fleet of 5 managed nodes to a defined security and operational baseline using only RHEL System Roles. The configuration must be idempotent, persistent across reboots, and follow the provided role documentation.

**Environment Requirements:**

* **Target Nodes:** 5 RHEL nodes with pre-existing unconfigured storage (at least one spare disk) and secondary network interfaces.
* **Role Availability:** Ensure `rhel-system-roles` is installed on the control node.

**Mandatory Configuration Tasks:**

1. **Network Integration:** Configure a static IPv4 address, netmask, and gateway on the secondary interface for all nodes using the `network` system role.
2. **Time Synchronization:** Set up an NTP baseline using the `timesync` system role, ensuring the nodes are synced to a local stratum-1 source provided in the lab environment.
3. **Storage Provisioning:** Utilize the `storage` system role to initialize a Physical Volume (PV), create a Volume Group (VG), and mount a Logical Volume (LV) formatted as XFS at `/opt/data`.
4. **Security Hardening:** Use the `selinux` system role to enforce `Enforcing` mode and apply specific custom Booleans and file context labels.
5. **Traffic Control:** Configure the `firewall` system role to ensure only SSH and a specific custom application port are active in the `public` zone.

**Success Criteria (The "Grading" Logic):**

* **Idempotency:** Re-running the playbook must result in `0` changes on the second pass.
* **Persistence:** All configurations must survive a system reboot (Verified via `systemd` status, `nmcli`, and `/etc/fstab` checks).
* **Documentation Reliance:** The solution must be implemented by parsing the local `/usr/share/doc/rhel-system-roles/` README files, rather than relying on external internet documentation.

---

### Instruction for the Mockup Generator

"Generate a lab scenario based on the specification above. Include a `requirements.yml` file, a structured `group_vars/all.yml` file where the complex nested role variables reside, and a main `site.yml` playbook that sequences these roles. Ensure the variables in `group_vars` are realistic but non-trivial (e.g., use lists and dictionaries) so the user is forced to verify the exact syntax in the role documentation."