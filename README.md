# London SDE/AI Centre Technical Documentation
Source code for https://d3london.github.io/sde_aic_external_docs/ which hosts technical documentation for AI Centre work across the London Secure Data Environment.

## Updating Documentation

### Prerequisites

### Quick Setup

Develop with the Devcontainer as part of this repo: [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/d3london/sde_aic_external_docs?quickstart=1)

#### Manual Setup

1. Install Quarto:
    - Visit the [Quarto website](https://quarto.org/docs/get-started/) and follow the installation instructions for your operating system if you wish to render documents locally.

2. Install Git:
   - If you haven't already, [install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on your local machine.

3. Clone the repository:
   ```
   git clone https://github.com/d3london/sde_aic_external_docs.git
   cd sde_aic_external_docs
   ```

4. Create a new branch for your changes:
   ```
   git checkout -b your-branch-name
   ```

### Working with Quarto

1. Make your changes to Quarto files (`.qmd` or `.md`).

2. Navigation structure is found in `_quarto.yml`.

3. Preview your changes locally:
   ```
   quarto preview
   ```
   This will open a local server where you can view your changes in real-time.

### Updating the GitHub Pages Site

1. Commit your changes:
   ```
   git add .
   git commit -m "commit message"
   ```

2. Push to GitHub:
   ```
   git push origin your-branch-name
   ```

3. Create a Pull Request (PR) on GitHub:
   - Go to the repository page on GitHub.
   - Click on "Pull requests" and then "New pull request".
   - Select your branch and create the PR.

4. Once your PR is reviewed and approved, it will be merged into the main branch automatically.

5. The GitHub Actions workflow will automatically build and deploy your changes to the GitHub Pages site.

### Additional Notes

The GitHub Pages site is automatically updated when changes are merged into the `main` branch. There's no need for manual deployment - the GitHub Actions workflow will handle this.

For more information on using Quarto with GitHub Pages, refer to the [Quarto documentation](https://quarto.org/docs/publishing/github-pages.html).


<a href="https://www.aicentre.co.uk/"><img src="src/media/logo_aic.png" alt="London AI Centre" title="" height="70" /></a>
