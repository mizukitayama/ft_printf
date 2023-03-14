CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror
RM		=	rm -rf
AR		=	ar rcs

SRCS	=	ft_printf.c ft_printf_utils.c ft_putpnt.c ft_putuint.c ft_puthex.c
LIBFT	=	libft

vpath %.c src

NAME	=	libftprintf.a

OBJ_DIR	=	obj

SRCS_OBJS	=	$(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(SRCS_OBJS)
	@make -C libft
	@cp $(LIBFT)/libft.a .
	@mv libft.a $(NAME)
	@$(AR) $(NAME) $(SRCS_OBJS)

clean:
	@make clean -C libft
	@$(RM) $(SRCS_OBJS)

fclean:	clean
	@$(RM) $(NAME)
	@$(RM) $(LIBFT)/libft.a

re:	fclean $(NAME)
	@make re -C libft