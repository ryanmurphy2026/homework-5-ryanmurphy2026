# Homework 5 Submission


Repo: https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-ryanmurphy2026 
cursorignore: https://github.com/ryanmurphy2026/homework-5-ryanmurphy2026/blob/3cf43cb6f3a7bd049c2fb13be2e091cde20bc0a1/.cursorignore 

Agents.md: https://github.com/ryanmurphy2026/homework-5-ryanmurphy2026/blob/3cf43cb6f3a7bd049c2fb13be2e091cde20bc0a1/Agents.md 
Rails conventions rule: https://github.com/ryanmurphy2026/homework-5-ryanmurphy2026/blob/3cf43cb6f3a7bd049c2fb13be2e091cde20bc0a1/rules/rails-conventions.mdc
Security rule: https://github.com/ryanmurphy2026/homework-5-ryanmurphy2026/blob/3cf43cb6f3a7bd049c2fb13be2e091cde20bc0a1/rules/security.mdc  


Part 3:

Ask mode

Prompt: Where in this codebase is the todo create behavior currently implemented? Cite the exact files and line numbers. Do not propose changes.

Response: Create behavior is implemented in app/controllers/todos_controller.rb at lines 23–35 (with 13–16 for new and 74–76 for permitted params), routed by config/routes.rb line 2, submitted via app/views/todos/_form.html.erb lines 1–22, and persisted through Todo / ActiveRecord against the todos table in db/schema.rb lines 14–19. There is no separate create logic in the model.

Verification

Plan mode: 

Prompt: I want to change the todo create behavior so that a newly created todo can optionally be marked as high priority. Propose a plan as a numbered list of changes, including files to edit, new tests to add, and any migration. Do not write code.

Response:
1. Add reversible migration: high_priority boolean default false on todos
2. Permit :high_priority in todo_params; add check_box to _form.html.erb
3. Add controller/model/system tests for create with and without high priority
4. Optionally show high_priority in _todo partial and JSON jbuilder

Bad → Good Prompt Rewrite

Bad prompt:

fix the bug in todos

Good prompt:

Context: The relevant files are `app/controllers/todos_controller.rb`, `app/views/todos/index.html.erb`, and `test/controllers/todos_controller_test.rb`.

Task: Fix the todo completion toggle so that clicking it updates the todo's completed state correctly.

Expected vs. actual: Expected: when a user clicks the completion toggle, the todo changes from incomplete to complete and the updated state appears on the index page. Actual: the request completes but the visible todo row does not update correctly.

Constraints: Only edit the todos controller, todo views, routes if needed, and related tests. Do not add new gems. Follow the existing Rails and Turbo patterns in this app.

Done when: `bin/rails test` passes and manually clicking the toggle in the browser updates the todo without breaking the index page.

Part 4:

Turbostream definition: Turbo streams is a response that tells the browser what part of the page to change and how without having to reload the full page.

One thing I verfied using the handbook is that Turbostream uses the MIME type

Pull request link: https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-ryanmurphy2026/pull/1#issue-4529030578 