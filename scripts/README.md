# Assembla / GitLab migration utility scripts

## API authentication

The following environment variables are required to use these utility scripts:

```
export ASSEMBLA_API_KEY=<<your key here>>
export ASSEMBLA_API_SECRET=<<your secret here>>
export GITLAB_PERSONAL_ACCESS_TOKEN=<<your personal access token here>>
```

References:
1. https://api-docs.assembla.cc/content/authentication.html
1. https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html

## Migration process

In summary, the migration process is:

1. Extract Assembla tickets to CSV
1. Import Assembla tickets into GitLab

### Extract Assembla tickets to CSV

Utility script:  `assembla_migrate_1_extract_tickets.rb`

1. Calls the `GET /v1/spaces` to allow the user to select the Assembla workspace they wish to extract.
1. Creates a CSV file representation of the Assembla tickets using `GET /v1/spaces/:space_id/tickets`

Output file format:
```
number,summary,description
1,"Ticket summary title","Ticket description","Status"
```
Additional considerations
1. Validate that the ticket numbers are sequential prior to writing the file
1. Retrieve the Assembla status for use as a label in the GitLab import

References:
1. https://api-docs.assembla.cc/content/ref/spaces_index.html
1. https://api-docs.assembla.cc/content/ref/tickets_index.html

### GitLab issue import

Utility script:  `assembla_migrate_2_gitlab_issues_import.rb`

References:
1. https://docs.gitlab.com/ee/api/projects.html#projects-api
1. https://docs.gitlab.com/ee/api/issues.html#new-issue