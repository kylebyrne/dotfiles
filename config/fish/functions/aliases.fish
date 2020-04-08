alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias fuckedit="git add . && git commit --amend --no-edit && git push -f && fortune | cowsay | lolcat "
alias new_db="rake db:drop db:create && pg_restore --no-privileges --no-owner -d marketplace_development --if-exists --clean < ./latest.dump"
alias lint="tinker --fix && rubocop -a && haml-lint"
