## Combined Log Format

The main problem with log files, and the need for a structured format,
is that they are typically unstructured text data, making it difficult to query the logs for any useful information.

A log format is a structured format that allows logs to be machine-readable and easily parsed.
This is the power of using structured logs and a log management system that supports them.

The Combined Log Format is a standardized log format used by a number of web servers to keep track of accesses to websites.

The format is defined by this expression:
```
"%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\""
```

This consists of the following space-separated fields:

- Hostname or IP address of accesser of site.

- RFC 1413 identity of client. This is noted as unreliable, and is usually blank (represented by a hyphen (-) in the file). 

- Username of user accessing document. Will be a hyphen for public web-sites that have no user access controls. 

- Timestamp string surrounded by square brackets, e.g. *[12/Dec/2012:12:12:12 -0500]*.

- HTTP request surrounded by double quotes, e.g., *"GET /stuff.html HTTP/1.1"*.

- HTTP status code.

- Number of bytes transferred in requested object.

- URL where user came from to get to your site (surrounded by double quotes).

- User agent string sent by client (surrounded by double quotes). Can be used to identify what browser was used.
