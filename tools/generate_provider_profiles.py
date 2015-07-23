from jinja2 import Environment, FileSystemLoader
import os
import stat

config_dir = "salt/cloud.providers.d"
env = Environment(loader=FileSystemLoader(config_dir))

for f in os.listdir(config_dir):
    if os.path.isfile(os.path.join(config_dir, f)):
        f_name, f_ext = os.path.splitext(f)
        if f_ext == ".template":
            target_name = f_name.replace("_", ".")
            template = env.get_template(f)
            target_file = config_dir + "/" + target_name
            open(target_file, 'w').close()
            os.chmod(target_file, stat.S_IREAD | stat.S_IWRITE)
            with open(target_file, "a") as f:
                f.write(template.render(env=os.environ))
