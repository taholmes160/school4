"""add relationship between dorm room and student table

Revision ID: 7e2789368e9b
Revises: 6ad3c412a9de
Create Date: 2023-11-24 17:27:01.896464

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7e2789368e9b'
down_revision = '6ad3c412a9de'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('tbl_student', schema=None) as batch_op:
        batch_op.add_column(sa.Column('dorm_room_id', sa.Integer(), nullable=True))
        batch_op.create_foreign_key(None, 'dorm_room', ['dorm_room_id'], ['id'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('tbl_student', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.drop_column('dorm_room_id')

    # ### end Alembic commands ###
