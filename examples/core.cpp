import std;

import type_list;

struct Fst;
struct Snd;
struct Trd;

using EmptyList = type_list::nil;
using List = type_list::from_pack_t<Fst, Snd, Trd>;
using BadCons = type_list::cons<Fst, Snd>;

static_assert(type_list::type_list<EmptyList>);
static_assert(type_list::type_list<List>);
static_assert(type_list::empty<EmptyList>);
static_assert(type_list::non_empty<List>);
static_assert(not type_list::type_list<BadCons>);
static_assert(type_list::size_v<EmptyList> == 0);
static_assert(type_list::size_v<List> == 3);

auto main() -> int {
    return 0;
}
