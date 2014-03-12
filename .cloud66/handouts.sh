mkdir -p $STACK_BASE/shared/uploads/course/handout
chown nginx:app_writers $STACK_BASE/shared/uploads/course/handout
rm -rf $STACK_PATH/public/uploads/course/handout
ln -nsf $STACK_BASE/shared/uploads/course/handout $STACK_PATH/public/uploads/course/handout
mkdir -p $STACK_BASE/shared/uploads/course/image
chown nginx:app_writers $STACK_BASE/shared/uploads/course/image
rm -rf $STACK_PATH/public/uploads/course/image
ln -nsf $STACK_BASE/shared/uploads/course/image $STACK_PATH/public/uploads/course/image
m
