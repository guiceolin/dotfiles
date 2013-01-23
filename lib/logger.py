class Logger:
  verbose = False
  def __init__(self, verbose=False):
    self.verbose = verbose

  def log(self, msg):
    if self.verbose:
      print(msg),
