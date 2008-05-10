
/* Find how deeply inside an .RPM the real data is */
/* kept, and report the offset in bytes */

/* Wouldn't it be a lot more sane if we could just untar these things? */

#include <stdlib.h>
#include <stdio.h>

/* These offsets keep getting bigger, so we're going to just bite a 2MB */
/* chunk of RAM right away so that we have enough.  Yeah, horrible */
/* quick and dirty implementation, but hey -- it gets the job done. */

#define RPMBUFSIZ 2097152

main()
{
        char *buff = malloc(RPMBUFSIZ),*eb,*p;
        for (p = buff, eb = buff + read(0,buff,RPMBUFSIZ); p < eb; p++)
                if (*p == '\037' && p[1] == '\213' && p[2] == '\010')
                        printf("%d\n",p - buff),
                        exit(0);
        exit(1);
}
