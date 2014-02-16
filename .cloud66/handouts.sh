mkdir -p $STACK_BASE/shared/uploads
chown nginx:app_writers $STACK_BASE/shared/uploads
ln -nsf $STACK_BASE/shared/uploads $STACK_PATH/uploads