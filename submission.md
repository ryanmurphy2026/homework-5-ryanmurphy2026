# Homework 5 Submission

## Part 1: Setup

Repo: https://github.com/NU-CS-Software-Studio-Spring-26/homework-5-ryanmurphy2026 
cursorignore: LINK_TO_CURSORIGNORE_FILE

Agents.md: 
Rails conventions rule: LINK_TO_RAILS_CONVENTIONS
Security rule: LINK_TO_SECURITY_RULE


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

> fix the bug in todos

Good prompt:

> Context: The relevant files are `app/controllers/todos_controller.rb`, `app/views/todos/index.html.erb`, and `test/controllers/todos_controller_test.rb`.
>
> Task: Fix the todo completion toggle so that clicking it updates the todo's completed state correctly.
>
> Expected vs. actual: Expected: when a user clicks the completion toggle, the todo changes from incomplete to complete and the updated state appears on the index page. Actual: the request completes but the visible todo row does not update correctly.
>
> Constraints: Only edit the todos controller, todo views, routes if needed, and related tests. Do not add new gems. Follow the existing Rails and Turbo patterns in this app.
>
> Done when: `bin/rails test` passes and manually clicking the toggle in the browser updates the todo without breaking the index page.

Part 4: