# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mverdier <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/10/09 13:44:17 by mverdier          #+#    #+#              #
#    Updated: 2019/04/12 12:34:42 by mverdier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors.

ORANGE =	\033[1;33m   #It is actually Yellow, but i changed yellow to orange.

GREEN =		\033[1;32m

RED =		\033[1;31m

RES =		\033[0m

#------------------------------------------------------------------------------#

NAME = 		

SRCDIR =	./srcs

INCDIR =	./includes

SRC =		

INC =		

SRCS =		$(SRC:%=$(SRCDIR)/%)

OBJS =		$(SRCS:%.c=%.o)

INCS =		$(INC:%=$(INCDIR)/%)

LIBDIR =	../libft

LIBNAME =	libft.a

LIBINC =	$(LIBDIR)/includes

#------------------------------------------------------------------------------#

CC =		gcc

CFLAGS =	-Wall			\
			-Wextra			\
			-Werror			\
			-g

INCFLAGS =	-I $(INCDIR)	\
			-I $(LIBINC)

LFLAGS =	-L $(LIBDIR) -l$(LIBNAME:lib%.a=%)

FLAGS =		$(CFLAGS)		\
			$(INCFLAGS)		\
			$(LFLAGS)

#------------------------------------------------------------------------------#
# Primary rules

all:
	@$(MAKE) $(NAME)

$(NAME): $(OBJS)
	@$(MAKE) printname
	@printf "%-15s%s\n" Linking $@
	@ar -crs $@ $(OBJS)
	@printf "$(GREEN)"
	@echo "Compilation done !"
	@printf "$(RES)"

#$(OBJS): $(INCS)

%.o: %.c $(INCS)
	@$(MAKE) printname
	@printf "%-15s%s\n" Compiling $@
	@$(CC) $(FLAGS) -o $@ -c $<

printname:
	@printf "$(ORANGE)"
	@printf "[%-15s " "$(NAME)]"
	@printf "$(RES)"

clean:
	@$(MAKE) printname
	@echo Suppressing obj files
	@printf "$(RED)"
	rm -rf $(OBJS)
	@printf "$(RES)"

fclean: clean
	@$(MAKE) printname
	@echo Suppressing $(NAME)
	@printf "$(RED)"
	rm -rf $(NAME)
	@printf "$(RES)"

re: fclean
	@$(MAKE) all

#------------------------------------------------------------------------------#
# List of all my optionnals but usefull rules.

git:	# A rule to make git add easier
	@$(MAKE) printname
	@echo Adding files to git repository
	@printf "$(GREEN)"
	git add $(SRCS) $(INCS) Makefile
	@printf "$(RES)"

.PHONY: all clean re fclean git
