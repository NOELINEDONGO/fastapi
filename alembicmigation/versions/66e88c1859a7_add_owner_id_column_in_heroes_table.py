"""Add owner_id column in heroes table

Revision ID: 66e88c1859a7
Revises: 
Create Date: 2025-07-30 10:15:18.987063

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '66e88c1859a7'
down_revision: Union[str, Sequence[str], None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.add_column("heroes", sa.Column("owner_id", sa.Integer(), nullable=True))
    op.create_foreign_key(
        "fk_heroes_owner_id", # name of constraint
        "heroes", # table source
        "players", # table target
        ["owner_id"], # source col
        ["id"] # target cal

    )

def downgrade() -> None:
    """Downgrade schema."""
    op.drop_constraint("fk_heroes_owner_id", "heroes", type_="foreignkey")
    op.drop_column("heroes", "owner_id")
