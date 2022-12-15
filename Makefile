# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jrouillo <jrouillo@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/08 10:11:35 by jrouillo          #+#    #+#              #
#    Updated: 2022/12/13 12:05:16 by jrouillo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRCS = ft_printf.c \
		ft_printf_char.c \
		ft_printf_int_unsigned.c \
		ft_printf_hexa_ptr.c

OBJS = ${SRCS:.c=.o}

FLAGS = -Wall -Werror -Wextra

LIBFT_PATH = libft

LIBFT = $(LIBFT_PATH)/libft.a

%.o: %.c ft_printf.h
	gcc ${FLAGS} -I. -c $< -o ${<:.c=.o}

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS) ft_printf.h
	ar -rsc ${NAME} ${OBJS}

$(LIBFT): 
	make -C $(LIBFT_PATH)

clean:
	make -C $(LIBFT_PATH) clean
	rm -f $(OBJS)

fclean: clean
	make -C $(LIBFT_PATH) fclean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re libft