FROM ubuntu:bionic

ENTRYPOINT /bin/bash

# Set the locale
RUN apt-get update && apt-get install -y --no-install-recommends locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install dependencies
RUN apt-get update && apt-get install -y git curl autoconf bison build-essential libssl1.0-dev \
    libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev \
    make libbz2-dev libreadline-dev wget llvm libncursesw5-dev xz-utils liblzma-dev python-openssl \
    sqlite3 libsqlite3-dev
RUN apt-get -y autoclean

# Install Ruby
RUN mkdir $HOME/.ruby
RUN git clone https://github.com/rbenv/ruby-build.git $HOME/.ruby-build
RUN $HOME/.ruby-build/bin/ruby-build 2.7.1 $HOME/.ruby
ENV PATH /root/.ruby/bin:$PATH
ENV RUBY_CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-document' >> /.gemrc
RUN gem install bundler:1.17.3 bundler:2.1.4 && gem update --system

# Install Python
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH /root/.pyenv/bin:$PATH
ENV PATH /root/.pyenv/shims:$PATH
RUN pyenv install 3.6.9
RUN pyenv global 3.6.9
RUN ln -s $(which python) /bin/python3

RUN apt-get -y autoremove && apt-get -y autoclean
