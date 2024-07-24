# Added by Toolbox App

export LC_ALL=en_US.UTF-8
export PATH="/Library/PostgreSQL/16/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="$HOME/my-awesome-tools:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_333.jdk/Contents/Home
export MAVEN_HOME="$HOME/development/apache-maven-3.8.8"

if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

export T_SESSION_NAME_INCLUDE_PARENT="true"
