"""Add student_id to DormRoom model

Revision ID: c86b293f23a8
Revises: 8c16305df9cb
Create Date: 2023-11-12 11:34:23.359393

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c86b293f23a8'
down_revision = '8c16305df9cb'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('tbl_dorm_rooms', schema=None) as batch_op:
        batch_op.create_foreign_key(None, 'tbl_student', ['student_id'], ['student_id'])

    with op.batch_alter_table('tbl_student', schema=None) as batch_op:
        # Add any additional commands here
        pass

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('tbl_student', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='unique')
        batch_op.create_index('ix_tbl_student_dorm_room_id_unique', ['dorm_room_id'], unique=False)
        batch_op.create_index('ix_tbl_student_dorm_room_id', ['dorm_room_id'], unique=False)

    with op.batch_alter_table('tbl_dorm_rooms', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.drop_column('student_id')

    # ### end Alembic commands ###
