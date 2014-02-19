mkdir -p $STACK_BASE/shared/uploads/course/handout
chown nginx:app_writers $STACK_BASE/shared/uploads/course/handout
ln -nsf $STACK_BASE/shared/uploads/course/handout $STACK_PATH/public/uploads/course/handout