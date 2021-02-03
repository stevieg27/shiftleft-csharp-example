FROM mcr.microsoft.com/dotnet/sdk:3.1

ARG SHIFTLEFT_ORG_ID
ARG SHIFTLEFT_ACCESS_TOKEN
ARG BRANCH=master

WORKDIR /app
COPY . /app/

# Perform dotnet restore
RUN dotnet restore netcoreConsole/netcoreConsole.sln

# Download ShiftLeft
RUN curl https://cdn.shiftleft.io/download/sl > sl && chmod a+rx sl

RUN echo $SHIFTLEFT_ORG_ID

# Perform sl analysis
RUN ./sl analyze --app netcoreConsole --tag app.group=csharp-team --tag branch=$BRANCH --csharp --dotnet-core --cpg netcoreConsole/netcoreConsole/netcoreConsole.csproj

# Now proceed to build the csharp application
