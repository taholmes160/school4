"""add dorm manager table

Revision ID: 8a5ce8acc781
Revises: a1cee89b5812
Create Date: 2023-11-22 12:26:24.510467

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '8a5ce8acc781'
down_revision = 'a1cee89b5812'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('dorm_manager',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('manager_name', sa.String(length=100), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('dorm_manager')
    # ### end Alembic commands ###
