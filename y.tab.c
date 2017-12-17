/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     SEMI = 258,
     LPAREN = 259,
     RPAREN = 260,
     LBRACE = 261,
     RBRACE = 262,
     COMMA = 263,
     PLUS = 264,
     MINUS = 265,
     TIMES = 266,
     DIVIDE = 267,
     ASSIGN = 268,
     NOT = 269,
     EQ = 270,
     NEQ = 271,
     LT = 272,
     LEQ = 273,
     GT = 274,
     GEQ = 275,
     TRUE = 276,
     FALSE = 277,
     AND = 278,
     OR = 279,
     RETURN = 280,
     IF = 281,
     ELSE = 282,
     FOR = 283,
     WHILE = 284,
     INT = 285,
     FLOAT = 286,
     BOOL = 287,
     VOID = 288,
     STRING = 289,
     LBRACKET = 290,
     RBRACKET = 291,
     COLOR = 292,
     CLUSTER = 293,
     NEW = 294,
     DOLLAR = 295,
     DOT = 296,
     POUND = 297,
     AT = 298,
     PROPERTY = 299,
     LITERAL = 300,
     ID = 301,
     FLOATLIT = 302,
     STRINGLIT = 303,
     EOF = 304,
     NOELSE = 305,
     NEG = 306
   };
#endif
/* Tokens.  */
#define SEMI 258
#define LPAREN 259
#define RPAREN 260
#define LBRACE 261
#define RBRACE 262
#define COMMA 263
#define PLUS 264
#define MINUS 265
#define TIMES 266
#define DIVIDE 267
#define ASSIGN 268
#define NOT 269
#define EQ 270
#define NEQ 271
#define LT 272
#define LEQ 273
#define GT 274
#define GEQ 275
#define TRUE 276
#define FALSE 277
#define AND 278
#define OR 279
#define RETURN 280
#define IF 281
#define ELSE 282
#define FOR 283
#define WHILE 284
#define INT 285
#define FLOAT 286
#define BOOL 287
#define VOID 288
#define STRING 289
#define LBRACKET 290
#define RBRACKET 291
#define COLOR 292
#define CLUSTER 293
#define NEW 294
#define DOLLAR 295
#define DOT 296
#define POUND 297
#define AT 298
#define PROPERTY 299
#define LITERAL 300
#define ID 301
#define FLOATLIT 302
#define STRINGLIT 303
#define EOF 304
#define NOELSE 305
#define NEG 306




/* Copy the first part of user declarations.  */
#line 3 "parser.mly"
 open Ast 

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 210 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   866

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  52
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  15
/* YYNRULES -- Number of rules.  */
#define YYNRULES  68
/* YYNRULES -- Number of states.  */
#define YYNSTATES  151

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   306

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     6,     7,    10,    13,    23,    24,    26,
      29,    34,    36,    38,    40,    42,    44,    46,    48,    52,
      53,    56,    60,    61,    64,    67,    70,    74,    78,    84,
      92,   102,   108,   109,   111,   113,   115,   117,   119,   127,
     143,   147,   149,   151,   155,   159,   163,   167,   171,   175,
     179,   183,   187,   191,   195,   199,   203,   209,   212,   215,
     223,   227,   232,   236,   243,   248,   249,   251,   253
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      53,     0,    -1,    54,    49,    -1,    -1,    54,    60,    -1,
      54,    55,    -1,    58,    46,     4,    56,     5,     6,    59,
      61,     7,    -1,    -1,    57,    -1,    58,    46,    -1,    57,
       8,    58,    46,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,    34,    -1,    38,    -1,    37,    -1,    58,    35,
      36,    -1,    -1,    59,    60,    -1,    58,    46,     3,    -1,
      -1,    61,    62,    -1,    64,     3,    -1,    25,     3,    -1,
      25,    64,     3,    -1,     6,    61,     7,    -1,    26,     4,
      64,     5,    62,    -1,    26,     4,    64,     5,    62,    27,
      62,    -1,    28,     4,    63,     3,    64,     3,    63,     5,
      62,    -1,    29,     4,    64,     5,    62,    -1,    -1,    64,
      -1,    45,    -1,    48,    -1,    21,    -1,    22,    -1,    42,
      64,     8,    64,     8,    64,    42,    -1,    40,    64,     8,
      64,     8,    64,     8,    64,     8,    64,     8,    64,     8,
      64,    40,    -1,    64,    43,    64,    -1,    46,    -1,    47,
      -1,    64,     9,    64,    -1,    64,    10,    64,    -1,    64,
      11,    64,    -1,    64,    12,    64,    -1,    64,    15,    64,
      -1,    64,    16,    64,    -1,    64,    17,    64,    -1,    64,
      18,    64,    -1,    64,    19,    64,    -1,    64,    20,    64,
      -1,    64,    23,    64,    -1,    64,    24,    64,    -1,    64,
      41,    46,    -1,    64,    41,    46,    13,    64,    -1,    10,
      64,    -1,    14,    64,    -1,    46,    13,    39,    58,    35,
      64,    36,    -1,    46,    13,    64,    -1,    46,     4,    65,
       5,    -1,     4,    64,     5,    -1,    46,    35,    64,    36,
      13,    64,    -1,    46,    35,    64,    36,    -1,    -1,    66,
      -1,    64,    -1,    66,     8,    64,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    38,    38,    41,    42,    43,    46,    54,    55,    58,
      59,    62,    63,    64,    65,    66,    67,    68,    69,    72,
      73,    76,    79,    80,    83,    84,    85,    86,    87,    88,
      89,    91,    94,    95,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   132,   133,   136,   137
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "SEMI", "LPAREN", "RPAREN", "LBRACE",
  "RBRACE", "COMMA", "PLUS", "MINUS", "TIMES", "DIVIDE", "ASSIGN", "NOT",
  "EQ", "NEQ", "LT", "LEQ", "GT", "GEQ", "TRUE", "FALSE", "AND", "OR",
  "RETURN", "IF", "ELSE", "FOR", "WHILE", "INT", "FLOAT", "BOOL", "VOID",
  "STRING", "LBRACKET", "RBRACKET", "COLOR", "CLUSTER", "NEW", "DOLLAR",
  "DOT", "POUND", "AT", "PROPERTY", "LITERAL", "ID", "FLOATLIT",
  "STRINGLIT", "EOF", "NOELSE", "NEG", "$accept", "program", "decls",
  "fdecl", "formals_opt", "formal_list", "typ", "vdecl_list", "vdecl",
  "stmt_list", "stmt", "expr_opt", "expr", "actuals_opt", "actuals_list", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    52,    53,    54,    54,    54,    55,    56,    56,    57,
      57,    58,    58,    58,    58,    58,    58,    58,    58,    59,
      59,    60,    61,    61,    62,    62,    62,    62,    62,    62,
      62,    62,    63,    63,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    65,    65,    66,    66
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     0,     2,     2,     9,     0,     1,     2,
       4,     1,     1,     1,     1,     1,     1,     1,     3,     0,
       2,     3,     0,     2,     2,     2,     3,     3,     5,     7,
       9,     5,     0,     1,     1,     1,     1,     1,     7,    15,
       3,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     5,     2,     2,     7,
       3,     4,     3,     6,     4,     0,     1,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     0,     0,     1,    11,    12,    13,    14,    15,    17,
      16,     2,     5,     0,     4,     0,     0,    18,    21,     7,
       0,     8,     0,     0,     0,     9,    19,     0,    22,    10,
       0,    20,     0,     0,     0,    22,     6,     0,     0,    36,
      37,     0,     0,     0,     0,     0,     0,    34,    41,    42,
      35,    23,     0,     0,     0,    57,    58,    25,     0,     0,
      32,     0,     0,     0,    65,     0,     0,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    62,    27,    26,     0,     0,    33,     0,     0,
       0,    67,     0,    66,     0,    60,     0,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      40,     0,     0,     0,     0,     0,    61,     0,     0,    64,
       0,    28,     0,    31,     0,     0,    68,     0,     0,    56,
       0,    32,     0,     0,     0,    63,    29,     0,     0,    38,
      59,     0,     0,    30,     0,     0,     0,     0,     0,     0,
      39
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     1,     2,    12,    20,    21,    13,    28,    14,    32,
      51,    86,    52,    92,    93
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -39
static const yytype_int16 yypact[] =
{
     -39,     9,   216,   -39,   -39,   -39,   -39,   -39,   -39,   -39,
     -39,   -39,   -39,   -33,   -39,   -22,    49,   -39,   -39,   256,
      16,    40,   -30,    17,   256,   -39,   -39,   -13,   256,   -39,
      15,   -39,   109,    51,   221,   -39,   -39,   221,   221,   -39,
     -39,    60,    47,    58,    65,   221,   221,   -39,    11,   -39,
     -39,   -39,   261,   347,   118,   -12,   -12,   -39,   296,   221,
     221,   221,   434,   470,   221,   176,   221,   -39,   221,   221,
     221,   221,   221,   221,   221,   221,   221,   221,   221,   221,
      25,   221,   -39,   -39,   -39,   382,    69,   823,   398,   221,
     221,   823,    72,    76,   256,   823,   702,    68,    68,   -12,
     -12,   454,   454,     8,     8,     8,   823,   418,   807,    74,
      48,   163,   221,   163,   506,   542,   -39,   221,    50,    82,
     221,    71,   331,   -39,   221,   221,   823,   192,   221,   823,
     163,   221,   578,   737,   753,   823,   -39,    91,   221,   -39,
     -39,   163,   614,   -39,   221,   650,   221,   686,   221,   788,
     -39
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -39,   -39,   -39,   -39,   -39,   -39,   -18,   -39,    73,    64,
     -38,   -20,   -34,   -39,   -39
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      53,    22,    15,    55,    56,    15,    27,    58,    77,     3,
      30,    62,    63,    16,    17,    64,    25,    68,    69,    70,
      71,    23,    15,    26,    65,    85,    87,    88,    77,    80,
      91,    95,    96,    29,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,    66,   110,    24,    80,
      15,    59,    18,    19,    18,   114,   115,    68,    69,    70,
      71,    33,    60,    57,    34,    74,    75,    76,    77,    61,
      37,   109,   112,   121,    38,   123,   118,   116,   122,    70,
      71,    39,    40,   126,   117,   127,   129,   120,    77,    80,
     132,   133,   136,   134,   135,   128,   141,    87,   130,    54,
      45,    31,    46,   143,   142,    47,    48,    49,    50,    80,
     145,   137,   147,    34,   149,    35,    36,     0,     0,    37,
       0,     0,    34,    38,    35,    83,     0,     0,    37,     0,
      39,    40,    38,     0,    41,    42,     0,    43,    44,    39,
      40,     0,     0,    41,    42,     0,    43,    44,     0,    45,
       0,    46,     0,     0,    47,    48,    49,    50,    45,     0,
      46,     0,     0,    47,    48,    49,    50,    34,     0,    35,
       0,     0,     0,    37,     0,     0,     0,    38,     0,     0,
      34,     0,     0,     0,    39,    40,    37,     0,    41,    42,
      38,    43,    44,     0,     0,     0,    34,    39,    40,     0,
       0,     0,    37,    45,     0,    46,    38,     0,    47,    48,
      49,    50,     0,    39,    40,    94,    45,     0,    46,     0,
       0,    47,    48,    49,    50,    34,     0,     0,    17,     0,
       0,    37,    45,     0,    46,    38,     0,    47,    48,    49,
      50,     0,    39,    40,     0,     0,     4,     5,     6,     7,
       8,     0,     0,     9,    10,     0,     0,     0,     0,     0,
       0,    45,     0,    46,    67,    11,    47,    48,    49,    50,
      68,    69,    70,    71,     0,     0,    72,    73,    74,    75,
      76,    77,     0,     0,    78,    79,     4,     5,     6,     7,
       8,     0,     0,     9,    10,     0,     0,     0,     0,    84,
       0,     0,    80,     0,    81,    68,    69,    70,    71,     0,
       0,    72,    73,    74,    75,    76,    77,     0,     0,    78,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   131,     0,     0,    80,     0,    81,
      68,    69,    70,    71,     0,     0,    72,    73,    74,    75,
      76,    77,    82,     0,    78,    79,    68,    69,    70,    71,
       0,     0,    72,    73,    74,    75,    76,    77,     0,     0,
      78,    79,    80,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   111,    80,     0,
      81,    68,    69,    70,    71,     0,     0,    72,    73,    74,
      75,    76,    77,   113,     0,    78,    79,    68,    69,    70,
      71,     0,     0,    72,    73,    74,    75,    76,    77,     0,
       0,    78,    79,    80,     0,    81,     0,    68,    69,    70,
      71,     0,     0,    72,    73,    74,    75,    76,    77,    80,
       0,    81,    89,    68,    69,    70,    71,     0,     0,    72,
      73,    74,    75,    76,    77,     0,     0,    78,    79,    80,
       0,    81,     0,    68,    69,    70,    71,     0,     0,     0,
       0,    74,    75,    76,    77,    80,     0,    81,    90,    68,
      69,    70,    71,     0,     0,    72,    73,    74,    75,    76,
      77,     0,     0,    78,    79,    80,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    81,   124,    68,    69,    70,    71,     0,
       0,    72,    73,    74,    75,    76,    77,     0,     0,    78,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    81,
     125,    68,    69,    70,    71,     0,     0,    72,    73,    74,
      75,    76,    77,     0,     0,    78,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,    81,   138,    68,    69,    70,
      71,     0,     0,    72,    73,    74,    75,    76,    77,     0,
       0,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,    81,   144,    68,    69,    70,    71,     0,     0,    72,
      73,    74,    75,    76,    77,     0,     0,    78,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,    81,   146,    68,
      69,    70,    71,     0,     0,    72,    73,    74,    75,    76,
      77,     0,     0,    78,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    81,   148,    68,    69,    70,    71,     0,
       0,    72,    73,    74,    75,    76,    77,     0,     0,    78,
      79,    68,    69,    70,    71,     0,     0,    72,    73,    74,
      75,    76,    77,     0,     0,    78,    79,    80,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,   119,     0,
       0,     0,     0,    80,     0,    81,    68,    69,    70,    71,
       0,     0,    72,    73,    74,    75,    76,    77,     0,     0,
      78,    79,    68,    69,    70,    71,     0,     0,    72,    73,
      74,    75,    76,    77,     0,     0,    78,    79,    80,   139,
      81,     0,     0,     0,     0,     0,     0,     0,     0,   140,
       0,     0,     0,     0,    80,     0,    81,    68,    69,    70,
      71,     0,     0,    72,    73,    74,    75,    76,    77,     0,
       0,    78,    79,     0,     0,     0,    68,    69,    70,    71,
       0,     0,    72,    73,    74,    75,    76,    77,   150,    80,
      78,    81,    68,    69,    70,    71,     0,     0,    72,    73,
      74,    75,    76,    77,     0,     0,    78,    79,    80,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,    81
};

static const yytype_int16 yycheck[] =
{
      34,    19,    35,    37,    38,    35,    24,    41,    20,     0,
      28,    45,    46,    46,    36,     4,    46,     9,    10,    11,
      12,     5,    35,     6,    13,    59,    60,    61,    20,    41,
      64,    65,    66,    46,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    35,    81,     8,    41,
      35,     4,     3,     4,     3,    89,    90,     9,    10,    11,
      12,    46,     4,     3,     4,    17,    18,    19,    20,     4,
      10,    46,     3,   111,    14,   113,    94,     5,   112,    11,
      12,    21,    22,   117,     8,    35,   120,    13,    20,    41,
     124,   125,   130,   127,   128,    13,     5,   131,    27,    35,
      40,    28,    42,   141,   138,    45,    46,    47,    48,    41,
     144,   131,   146,     4,   148,     6,     7,    -1,    -1,    10,
      -1,    -1,     4,    14,     6,     7,    -1,    -1,    10,    -1,
      21,    22,    14,    -1,    25,    26,    -1,    28,    29,    21,
      22,    -1,    -1,    25,    26,    -1,    28,    29,    -1,    40,
      -1,    42,    -1,    -1,    45,    46,    47,    48,    40,    -1,
      42,    -1,    -1,    45,    46,    47,    48,     4,    -1,     6,
      -1,    -1,    -1,    10,    -1,    -1,    -1,    14,    -1,    -1,
       4,    -1,    -1,    -1,    21,    22,    10,    -1,    25,    26,
      14,    28,    29,    -1,    -1,    -1,     4,    21,    22,    -1,
      -1,    -1,    10,    40,    -1,    42,    14,    -1,    45,    46,
      47,    48,    -1,    21,    22,    39,    40,    -1,    42,    -1,
      -1,    45,    46,    47,    48,     4,    -1,    -1,    36,    -1,
      -1,    10,    40,    -1,    42,    14,    -1,    45,    46,    47,
      48,    -1,    21,    22,    -1,    -1,    30,    31,    32,    33,
      34,    -1,    -1,    37,    38,    -1,    -1,    -1,    -1,    -1,
      -1,    40,    -1,    42,     3,    49,    45,    46,    47,    48,
       9,    10,    11,    12,    -1,    -1,    15,    16,    17,    18,
      19,    20,    -1,    -1,    23,    24,    30,    31,    32,    33,
      34,    -1,    -1,    37,    38,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    41,    -1,    43,     9,    10,    11,    12,    -1,
      -1,    15,    16,    17,    18,    19,    20,    -1,    -1,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    41,    -1,    43,
       9,    10,    11,    12,    -1,    -1,    15,    16,    17,    18,
      19,    20,     5,    -1,    23,    24,     9,    10,    11,    12,
      -1,    -1,    15,    16,    17,    18,    19,    20,    -1,    -1,
      23,    24,    41,    -1,    43,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     5,    41,    -1,
      43,     9,    10,    11,    12,    -1,    -1,    15,    16,    17,
      18,    19,    20,     5,    -1,    23,    24,     9,    10,    11,
      12,    -1,    -1,    15,    16,    17,    18,    19,    20,    -1,
      -1,    23,    24,    41,    -1,    43,    -1,     9,    10,    11,
      12,    -1,    -1,    15,    16,    17,    18,    19,    20,    41,
      -1,    43,     8,     9,    10,    11,    12,    -1,    -1,    15,
      16,    17,    18,    19,    20,    -1,    -1,    23,    24,    41,
      -1,    43,    -1,     9,    10,    11,    12,    -1,    -1,    -1,
      -1,    17,    18,    19,    20,    41,    -1,    43,     8,     9,
      10,    11,    12,    -1,    -1,    15,    16,    17,    18,    19,
      20,    -1,    -1,    23,    24,    41,    -1,    43,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    41,    -1,    43,     8,     9,    10,    11,    12,    -1,
      -1,    15,    16,    17,    18,    19,    20,    -1,    -1,    23,
      24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    41,    -1,    43,
       8,     9,    10,    11,    12,    -1,    -1,    15,    16,    17,
      18,    19,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    41,    -1,    43,     8,     9,    10,    11,
      12,    -1,    -1,    15,    16,    17,    18,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    41,
      -1,    43,     8,     9,    10,    11,    12,    -1,    -1,    15,
      16,    17,    18,    19,    20,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    41,    -1,    43,     8,     9,
      10,    11,    12,    -1,    -1,    15,    16,    17,    18,    19,
      20,    -1,    -1,    23,    24,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    41,    -1,    43,     8,     9,    10,    11,    12,    -1,
      -1,    15,    16,    17,    18,    19,    20,    -1,    -1,    23,
      24,     9,    10,    11,    12,    -1,    -1,    15,    16,    17,
      18,    19,    20,    -1,    -1,    23,    24,    41,    -1,    43,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,    -1,
      -1,    -1,    -1,    41,    -1,    43,     9,    10,    11,    12,
      -1,    -1,    15,    16,    17,    18,    19,    20,    -1,    -1,
      23,    24,     9,    10,    11,    12,    -1,    -1,    15,    16,
      17,    18,    19,    20,    -1,    -1,    23,    24,    41,    42,
      43,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,
      -1,    -1,    -1,    -1,    41,    -1,    43,     9,    10,    11,
      12,    -1,    -1,    15,    16,    17,    18,    19,    20,    -1,
      -1,    23,    24,    -1,    -1,    -1,     9,    10,    11,    12,
      -1,    -1,    15,    16,    17,    18,    19,    20,    40,    41,
      23,    43,     9,    10,    11,    12,    -1,    -1,    15,    16,
      17,    18,    19,    20,    -1,    -1,    23,    24,    41,    -1,
      43,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    41,    -1,    43
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    53,    54,     0,    30,    31,    32,    33,    34,    37,
      38,    49,    55,    58,    60,    35,    46,    36,     3,     4,
      56,    57,    58,     5,     8,    46,     6,    58,    59,    46,
      58,    60,    61,    46,     4,     6,     7,    10,    14,    21,
      22,    25,    26,    28,    29,    40,    42,    45,    46,    47,
      48,    62,    64,    64,    61,    64,    64,     3,    64,     4,
       4,     4,    64,    64,     4,    13,    35,     3,     9,    10,
      11,    12,    15,    16,    17,    18,    19,    20,    23,    24,
      41,    43,     5,     7,     3,    64,    63,    64,    64,     8,
       8,    64,    65,    66,    39,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    64,    46,
      64,     5,     3,     5,    64,    64,     5,     8,    58,    36,
      13,    62,    64,    62,     8,     8,    64,    35,    13,    64,
      27,     3,    64,    64,    64,    64,    62,    63,     8,    42,
      36,     5,    64,    62,     8,    64,     8,    64,     8,    64,
      40
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 38 "parser.mly"
    { (yyvsp[(1) - (2)]) }
    break;

  case 3:
#line 41 "parser.mly"
    { [], [] }
    break;

  case 4:
#line 42 "parser.mly"
    { ((yyvsp[(2) - (2)]) :: fst (yyvsp[(1) - (2)])), snd (yyvsp[(1) - (2)]) }
    break;

  case 5:
#line 43 "parser.mly"
    { fst (yyvsp[(1) - (2)]), ((yyvsp[(2) - (2)]) :: snd (yyvsp[(1) - (2)])) }
    break;

  case 6:
#line 47 "parser.mly"
    { { typ = (yyvsp[(1) - (9)]);
	 fname = (yyvsp[(2) - (9)].string);
	 formals = (yyvsp[(4) - (9)]);
	 locals = List.rev (yyvsp[(7) - (9)]);
	 body = List.rev (yyvsp[(8) - (9)]) } }
    break;

  case 7:
#line 54 "parser.mly"
    { [] }
    break;

  case 8:
#line 55 "parser.mly"
    { List.rev (yyvsp[(1) - (1)]) }
    break;

  case 9:
#line 58 "parser.mly"
    { [((yyvsp[(1) - (2)]),(yyvsp[(2) - (2)].string))] }
    break;

  case 10:
#line 59 "parser.mly"
    { ((yyvsp[(3) - (4)]),(yyvsp[(4) - (4)].string)) :: (yyvsp[(1) - (4)]) }
    break;

  case 11:
#line 62 "parser.mly"
    { Int }
    break;

  case 12:
#line 63 "parser.mly"
    { Float }
    break;

  case 13:
#line 64 "parser.mly"
    { Bool }
    break;

  case 14:
#line 65 "parser.mly"
    { Void }
    break;

  case 15:
#line 66 "parser.mly"
    { String }
    break;

  case 16:
#line 67 "parser.mly"
    {Cluster}
    break;

  case 17:
#line 68 "parser.mly"
    { Color }
    break;

  case 18:
#line 69 "parser.mly"
    { ArrayType((yyvsp[(1) - (3)])) }
    break;

  case 19:
#line 72 "parser.mly"
    { [] }
    break;

  case 20:
#line 73 "parser.mly"
    { (yyvsp[(2) - (2)]) :: (yyvsp[(1) - (2)]) }
    break;

  case 21:
#line 76 "parser.mly"
    { ((yyvsp[(1) - (3)]), (yyvsp[(2) - (3)].string)) }
    break;

  case 22:
#line 79 "parser.mly"
    { [] }
    break;

  case 23:
#line 80 "parser.mly"
    { (yyvsp[(2) - (2)]) :: (yyvsp[(1) - (2)]) }
    break;

  case 24:
#line 83 "parser.mly"
    { Expr (yyvsp[(1) - (2)]) }
    break;

  case 25:
#line 84 "parser.mly"
    { Return Noexpr }
    break;

  case 26:
#line 85 "parser.mly"
    { Return (yyvsp[(2) - (3)]) }
    break;

  case 27:
#line 86 "parser.mly"
    { Block(List.rev (yyvsp[(2) - (3)])) }
    break;

  case 28:
#line 87 "parser.mly"
    { If((yyvsp[(3) - (5)]), (yyvsp[(5) - (5)]), Block([])) }
    break;

  case 29:
#line 88 "parser.mly"
    { If((yyvsp[(3) - (7)]), (yyvsp[(5) - (7)]), (yyvsp[(7) - (7)])) }
    break;

  case 30:
#line 90 "parser.mly"
    { For((yyvsp[(3) - (9)]), (yyvsp[(5) - (9)]), (yyvsp[(7) - (9)]), (yyvsp[(9) - (9)])) }
    break;

  case 31:
#line 91 "parser.mly"
    { While((yyvsp[(3) - (5)]), (yyvsp[(5) - (5)])) }
    break;

  case 32:
#line 94 "parser.mly"
    { Noexpr }
    break;

  case 33:
#line 95 "parser.mly"
    { (yyvsp[(1) - (1)]) }
    break;

  case 34:
#line 98 "parser.mly"
    { Literal((yyvsp[(1) - (1)].int)) }
    break;

  case 35:
#line 99 "parser.mly"
    { StringLit((yyvsp[(1) - (1)].string)) }
    break;

  case 36:
#line 100 "parser.mly"
    { BoolLit(true) }
    break;

  case 37:
#line 101 "parser.mly"
    { BoolLit(false) }
    break;

  case 38:
#line 102 "parser.mly"
    { ColorLit((yyvsp[(2) - (7)]), (yyvsp[(4) - (7)]), (yyvsp[(6) - (7)])) }
    break;

  case 39:
#line 103 "parser.mly"
    { ClusterLit((yyvsp[(2) - (15)]), (yyvsp[(4) - (15)]), (yyvsp[(6) - (15)]), (yyvsp[(8) - (15)]), (yyvsp[(10) - (15)]), (yyvsp[(12) - (15)]), (yyvsp[(14) - (15)]))}
    break;

  case 40:
#line 104 "parser.mly"
    { Collision((yyvsp[(1) - (3)]), (yyvsp[(3) - (3)])) }
    break;

  case 41:
#line 105 "parser.mly"
    { Id((yyvsp[(1) - (1)].string)) }
    break;

  case 42:
#line 106 "parser.mly"
    { FloatLit((yyvsp[(1) - (1)].float)) }
    break;

  case 43:
#line 107 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Add,   (yyvsp[(3) - (3)])) }
    break;

  case 44:
#line 108 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Sub,   (yyvsp[(3) - (3)])) }
    break;

  case 45:
#line 109 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Mult,  (yyvsp[(3) - (3)])) }
    break;

  case 46:
#line 110 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Div,   (yyvsp[(3) - (3)])) }
    break;

  case 47:
#line 111 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Equal, (yyvsp[(3) - (3)])) }
    break;

  case 48:
#line 112 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Neq,   (yyvsp[(3) - (3)])) }
    break;

  case 49:
#line 113 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Less,  (yyvsp[(3) - (3)])) }
    break;

  case 50:
#line 114 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Leq,   (yyvsp[(3) - (3)])) }
    break;

  case 51:
#line 115 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Greater, (yyvsp[(3) - (3)])) }
    break;

  case 52:
#line 116 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Geq,   (yyvsp[(3) - (3)])) }
    break;

  case 53:
#line 117 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), And,   (yyvsp[(3) - (3)])) }
    break;

  case 54:
#line 118 "parser.mly"
    { Binop((yyvsp[(1) - (3)]), Or,    (yyvsp[(3) - (3)])) }
    break;

  case 55:
#line 119 "parser.mly"
    { PropertyAccess((yyvsp[(1) - (3)]), (yyvsp[(3) - (3)].string)) }
    break;

  case 56:
#line 120 "parser.mly"
    { PropertyAssign((yyvsp[(1) - (5)]), (yyvsp[(3) - (5)].string), (yyvsp[(5) - (5)])) }
    break;

  case 57:
#line 121 "parser.mly"
    { Unop(Neg, (yyvsp[(2) - (2)])) }
    break;

  case 58:
#line 122 "parser.mly"
    { Unop(Not, (yyvsp[(2) - (2)])) }
    break;

  case 59:
#line 123 "parser.mly"
    { ArrayInit((yyvsp[(1) - (7)].string), (yyvsp[(4) - (7)]), (yyvsp[(6) - (7)])) }
    break;

  case 60:
#line 124 "parser.mly"
    { Assign((yyvsp[(1) - (3)].string), (yyvsp[(3) - (3)])) }
    break;

  case 61:
#line 125 "parser.mly"
    { Call((yyvsp[(1) - (4)].string), (yyvsp[(3) - (4)])) }
    break;

  case 62:
#line 126 "parser.mly"
    { (yyvsp[(2) - (3)]) }
    break;

  case 63:
#line 127 "parser.mly"
    { ArrayAssign((yyvsp[(1) - (6)].string), (yyvsp[(3) - (6)]), (yyvsp[(6) - (6)])) }
    break;

  case 64:
#line 128 "parser.mly"
    { ArrayAccess((yyvsp[(1) - (4)].string), (yyvsp[(3) - (4)])) }
    break;

  case 65:
#line 132 "parser.mly"
    { [] }
    break;

  case 66:
#line 133 "parser.mly"
    { List.rev (yyvsp[(1) - (1)]) }
    break;

  case 67:
#line 136 "parser.mly"
    { [(yyvsp[(1) - (1)])] }
    break;

  case 68:
#line 137 "parser.mly"
    { (yyvsp[(3) - (3)]) :: (yyvsp[(1) - (3)]) }
    break;


/* Line 1267 of yacc.c.  */
#line 2013 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



