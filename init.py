from core.models.user import User
import core.db  as db
from core.config import cfg
from core.auth import pwd_context

def init_user():
      db.DB.session.add(User(
          id=0,
          username=cfg.get("admin","admin"),
          password_hash=pwd_context.hash(cfg.get("passwd","Csol@123654")),
      ))
      db.DB.session.commit()

init_user()