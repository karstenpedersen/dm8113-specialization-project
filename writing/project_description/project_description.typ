#import "../metadata.typ": *
#import "../project_description/lib/project_description_template.typ": (
  project_description,
)

#import "../shared/lib/todo.typ": TODO

#set document(title: title)

#show: project_description.with(
  title: title,
  subtitle: subtitle,
  authors: authors,
  advisors: advisors,
  bibliography_sources: "../references.bib",
)

// = Thesis Proposal Skeleton

// Write a 1 or 2 pages max document structured as follows.

// = Title
// Provide a concise and descriptive title for your thesis.


= Motivation & Goal

// Clearly state the context and the motivation behind your research and the primary goal you aim to achieve.

Infrastructure as Code (IaC) is the practice of configuring and provisioning infrastructure using code instead of manual configuration.
This enables faster and repeatable deployments, and is a key enabler of DevOps practices, allowing infrastructure to be automated through Continuous Integration (CI) and Continuous Delivery (CD) pipelines @morris_iac.

However, automating infrastructure through code also introduces security risks. A single tool in the pipeline can manage the entire infrastructure, so compromising that tool, or the pipeline itself, can have serious consequences. These tools and pipelines often have access to sensitive secrets, and the tools maintains state describing the infrastructure they manage. Security is therefore a critical concern in IaC. It is necessary to include security checks, feedback, and guardrails at every step of the pipeline process, from development and build to deploy and runtime @owasp_iac_cheatsheet.

The goal of this project is to explore IaC from a security stand point, identifying common vulnerability classes and evaluating how well existing defenses address them, by examining real tools such as Terraform @terraform, Pulumi @pulumi, Ansible @ansible, and Crossplane @crossplane, and analysing how each fits into a CI/CD workflow and how they resolve and verifies external modules and handles state, secrets, and drift.


= Plan of Activities

There already exists literature on security and IaC. Existing work has studied security smells in scripts associated with IaC tools such as Terraform and Pulumi @war2025securitysmellsinfrastructurecode, and general CI/CD pipeline security has been examined through structured threat modelling @dhandapani2025enhancingsoftwaresupplychain. The IaC tools themselves also document their security features, such as secret management.

References to start with:

- Infrastructure as Code: Dynamic Systems for the Cloud Age @morris_iac
- Infrastructure as Code: Patterns and Practices @wang_iac_patterns
- SoK: Taxonomy of Attacks on Open-Source Software Supply Chains @ladisa2023sok
- Security smells in infrastructure as code: a taxonomy update beyond the seven sins @war2025securitysmellsinfrastructurecode
- Enhancing Software Supply Chain Security Through STRIDE-Based Threat Modelling of CI/CD Pipelines @dhandapani2025enhancingsoftwaresupplychain
- OWASP Top 10:2025 @owasp2025_top10
- OWASP Infrastructure as Code Security Cheatsheet @owasp_iac_cheatsheet

In the research phase the methodology consists of reading and combining existing research and documentation. This will lead into an analysis phase, where we will analyse each of the four IaC tools and profile them from a security stand point. These results can then be used to define vulnerability classes and map them to existing defenses.


// Describe the task to perform the thesis. These should include, if relevant

// 1. Survey of the State-of-the-Art
// Conduct a thorough literature review. In particular mention if there has been done something in the literature that gets close to your goal?
// List key references (books, articles, online material) that you will start to use to consult to understand the current state of research.
// This allows the study board to make sure that you know where to start.

// 2. Development or Research Phase
// Outline the methodology you will use.
// Describe in general terms what you will do and how you will do it.
// Which tools, algorithms will help you to accomplish your goals?

// 3. Experiments
// Detail the experiments you plan to conduct.
// Specify the research question you aim to answer and the type of experiments required.
// If using data, what are the data you are planning to use and where you are getting it from?

// 4. Analysis
// Describe how you will analyze the data collected from your experiments.
// Include a plan for additional time to rerun experiments if necessary.

// 5. Finalizing the Report/Thesis
// Note that you should ensure it follows academic conventions as outlined by Justin Zobel (Writing for Computer Science. Springer 2014, ISBN 978-1-4471-6638-2, pp. 1-264.). The book is freely available online via the library.


= Tentative Time Plan

/ September:

- Research IaC area and tools
- Review existing literature

/ October:

- Analyse IaC tools (Terraform, Pulumi, Ansible, Crossplane)
- Research vulnerabilities and existing defenses

/ November:

- Create taxonomy for classifying vulnerabilities in IaC
- Map vulnerability classes to existing defenses

/ December:

- Finalize the report

/ January:

- Submit the project

// Provide a tentative timeline for each expected major milestone (intervals such as 2 weeks/1 month are fine).
// Possible usual task to consider for inspiration are the following ones:

// - Reviewing the literature.
// - Formulating some questions or hypotheses
// - Identifying the methods and tools most likely to help us to answer these questions.
// - Implementing a software for acquiring, pre-processing, and cleaning the data at real-time.
// - Implementing the methods in a software.
// - Collecting results and analyzing them.
// - Commenting the results of the analysis and draw conclusions.
// - Conduct more experiments in the light of the first results obtained.
// - Reporting the work done in a report written in a language appropriate to the field of study.


= Risk Evaluation

The IaC tools may not have enough documentation covering their trust and execution model, secret handling, and other security details. This could require reading the tools source code directly to understand their behaviour. The remedy for this could be to only look at two or three of the tools, if there isn't enough time.

// Identify potential risks (e.g., difficulty in obtaining data).
// Propose possible remedies (e.g., use anonymized data, simulate data).


= Outcome

The expected outcome of this project is a report written in English that surveys the current state of security in Infrastructure as Code, with a focus on CI/CD. It will present a structured overview of known vulnerabilities and existing defenses, including a taxonmy of vulnerability classes relevant to IaC pipelines.


// = Bibliography

// List all the references you plan to use to start the investigation of the state of the art.
// See, e.g., [bibtex](https://www.overleaf.com/learn/latex/Bibliography_management_with_bibtex) for instructions on how to include references if using latex, and [DBLP](https://dblp.uni-trier.de/) as source of CS literature entries (bibtex-entries provided in a well-curated format).
