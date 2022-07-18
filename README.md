# Ritexe: A Discussion Forum for RIT.

S6 CSE Course miniproject.

## Initialise docker:
```docker run --name mysqldb -d -p 6969:3306 -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=ritexe mysql```

## Start server:
```uvicorn index:app --reload```

## Endpoint:
<a href="http://localhost:8000/docs">http://localhost:8000/docs</a>
