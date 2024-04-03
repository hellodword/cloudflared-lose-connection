# cloudflared-lose-connection

Serve a large(4GB) file with cloudflared, and limit the bandwidth to 4k, then it requires two weeks to download the file.

But the client will lose connection, even they (cloudflared and the curl client) both run on the AWS.

This is a reproduce, and try to find out the reason, I guess it's because of the QUIC of cloudflared or other limitation of cloudflared, not the client side.
