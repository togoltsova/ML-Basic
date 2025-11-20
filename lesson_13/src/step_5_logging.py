import logging


logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s: %(message)s")

logging.info("INFO level")
logging.debug("DEBUG level")
logging.warning("WARNING level")
logging.error("ERROR level")
logging.critical("CRITICAL level")

# в файл
logging.basicConfig(filename="log_1.log", level=logging.DEBUG, format="%(asctime)s %(levelname)s: %(message)s")
logging.info("INFO level")
logging.debug("DEBUG level")

file_handler = logging.FileHandler("log_2.log", mode="a", encoding="utf-8")
file_handler.setFormatter(
    logging.Formatter("%(asctime)s %(levelname)s: %(message)s", datefmt="%Y-%m-%d %H:%M:%S")
)
file_handler.setLevel(logging.DEBUG)
logging.getLogger().addHandler(file_handler)

logging.info("INFO level")
logging.debug("DEBUG level")

console_handler = logging.StreamHandler()
console_handler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
console_handler.setLevel(logging.INFO)
logging.getLogger().addHandler(console_handler)

print()
logging.info("INFO level")
logging.debug("DEBUG level")
logging.warning("WARNING level")
logging.error("ERROR level")
logging.critical("CRITICAL level")