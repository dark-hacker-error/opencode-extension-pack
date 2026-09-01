# GitHub Tools
## GitHub MCP Server tools

Tools available through GitHub MCP Server:
- github_add_comment_to_pending_review
- github_add_issue_comment
- github_add_reply_to_pull_request_comment
- github_create_branch
- github_create_or_update_file
- github_create_pull_request
- github_create_repository
- github_delete_file
- github_fork_repository
- github_get_commit
- github_get_file_contents
- github_get_label
- github_get_latest_release
- github_get_me
- github_get_release_by_tag
- github_get_tag
- github_get_team_members
- github_get_teams
- github_issue_read
- github_issue_write
- github_list_branches
- github_list_commits
- github_list_issue_fields
- github_list_issue_types
- github_list_issues
- github_list_pull_requests
- github_list_releases
- github_list_repository_collaborators
- github_list_tags
- github_merge_pull_request
- github_pull_request_read
- github_pull_request_review_write
- github_push_files
- github_request_copilot_review
- github_run_secret_scanning
- github_search_code
- github_search_commits
- github_search_issues
- github_search_pull_requests
- github_search_repositories
- github_search_users
- github_sub_issue_write
- github_update_pull_request
- github_update_pull_request_branch

## Usage
All tools use the format:
```json
{"tool": "github_<action>", "args": {...}}
```