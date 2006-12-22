/*
 * Header taken from http://bugzilla.ubuntu.com/show_bug.cgi?id=18157, thanks
 * to Glibc weirdness.
 */

#ifndef _SYS_KD_H
#define _SYS_KD_H   1

/* Make sure the <linux/types.h> header is not loaded.  */
#ifndef _LINUX_TYPES_H
# define _LINUX_TYPES_H 1
# define __undef_LINUX_TYPES_H 1
#endif

#include <linux/kd.h>

#ifdef __undef_LINUX_TYPES_H
# undef _LINUX_TYPES_H
# undef __undef_LINUX_TYPES_H
#endif

#endif  /* sys/kd.h */
