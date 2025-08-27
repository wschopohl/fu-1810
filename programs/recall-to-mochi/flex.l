%{
#include <stdbool.h>

#define QUESTION_END "---"
#define CARD_END     "+++"

int questions = 0;
bool question_found = false;
char answer[1024] = {0};
int answer_len = 0;

void handle_question();
%}

any                 (.|\n)
line_end            (\r\n|\n)

%%

###.*\?{line_end}   handle_question();
{any}               if(question_found) answer[answer_len++] = yytext[0];

%%

void handle_question() {
    if(question_found) {
        answer[answer_len] = 0;
        printf("%s", answer);
        printf(CARD_END "\n");
        answer_len = 0;
    }
    printf("%s", yytext);
    printf(QUESTION_END "\n");
    question_found = true;
    ++questions;
}

int main(int argc, char **argv) {
    yylex(); // need only be called once, because no return
    if(argc > 1 && strcmp(argv[1], "-v") == 0) { 
        printf("\n\nQuestions: %d\n", questions);
    }
    return 0;
}

int yywrap() {
    if(question_found) {
        answer[answer_len] = 0;
        printf("%s", answer);
    }
    return 1;
}