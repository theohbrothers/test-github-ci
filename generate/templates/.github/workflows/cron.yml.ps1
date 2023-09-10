@'
name: cron
on:
  schedule:
    # Run daily
    - cron: '0 * * * *'
jobs:
  update-versions-with-pr:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
    steps:
    # Admin user must generate a Personal Access Token with 'workflow' permissions, and used to populate the secret named WORKFLOW_TOKEN.
    # See: https://stackoverflow.com/questions/68811838/refusing-to-allow-a-personal-access-token-to-create-or-update-workflow
    # See: https://stackoverflow.com/questions/66643917/refusing-to-allow-a-github-app-to-create-or-update-workflow
    - name: Checkout
      uses: actions/checkout@v3
      with:
        token: ${{ secrets.WORKFLOW_TOKEN }}  # This configures the git repo to use this token
    - shell: pwsh
      run: |
        ./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
      env:
        GITHUB_TOKEN: ${{ secrets.WORKFLOW_TOKEN }}

'@
