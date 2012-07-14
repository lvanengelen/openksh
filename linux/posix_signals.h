#ifndef POSIX_SIGNALS_H
#define POSIX_SIGNALS_H

#include <signal.h>

struct signv {
	char	*name;
	int	 val;
};

extern struct signv sys_signame[NSIG];

#endif /* ! POSIX_SIGNALS_H */
