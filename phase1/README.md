# Phase 1: Git Workflow and Linux Automation

1. **OBJECTIVES**

    The primary objective of Phase 1 is to establish a professional foundational environment for the **Product Management System**. This phase focuses on:
- **Repository Standardization**: Implementing a disciplined organizational structure.
- **Collaborative Governance**: Enforcing strict Git workflows and branch protection policies.
- **Environment Automation**: Developing a shell script to automate the preparation of the Ubuntu cloud runtime.

2. **COLLABORATIVE GIT WORKFLOW**

    To ensure code quality and team synchronization, we adopted a feature-branch workflow.

    - **Branching Strategy**: All development was conducted in separate branches (e.g., `feature/automation`, `feature/dockerfile`).
    - **Branch Protection Policies**: The `main` branch was protected with the following rules:

        -   **Pull Request Requirement**: Direct commits to `main` are strictly prohibited.
        - **Peer Review**: Every Pull Request requires at least one formal approval from the Team Leader before merging.
        - **No Bypass**: The protection rules apply to all members, including administrators.

3. **LINUX AUTOMATION SCRIPT** **(`setup.sh`)**

    A functional automation script was developed to streamline the server provisioning process.
    - **Location**: Located at `scripts/setup.sh` (referenced within this phase).
    - **Key Operations**:

        - Installs essential system dependencies and language runtimes (Node.js).
        - Automates the configuration of Nginx and MongoDB on the host OS.
        - Establishes the required directory structures for logs and persistent data.

4. **REPOSITORY ORGANIZATION**
    The Phase 1 artifacts are organized as follows to ensure reproducibility:

    - `/scripts`: Contains the `setup.sh` automation script.
    - `/evidence/git-workflow`: Contains screenshots of branch protection settings, PR reviews, and contributor history.
    - `/evidence/automation`: Contains evidence of the script execution success on the AWS EC2 instance.
    - **Note on Root Files**: To maintain project-wide consistency, core application files including the `src/` directory and the `.gitignore` file are managed at the repository root level.

5. **IMPLEMENTATION EVIDENCE**
    Detailed evidence of Phase 1 compliance is located in the `evidence/` sub-directory:

    - **Branch Protection**: Documented evidence of enforced PR and approval policies.
    - **Git History**: Evidence of meaningful contributions and collaborative interactions via Pull Requests.