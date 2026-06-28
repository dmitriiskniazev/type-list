import std;

import type_list;

struct Fst;
struct Snd;
struct Trd;

using List = type_list::from_pack_t<Fst, Snd, Trd>;

static_assert(std::same_as<type_list::front_t<List>, Fst>);
static_assert(std::same_as<type_list::back_t<List>, Trd>);

using PoppedFront = type_list::pop_front_t<List>;
static_assert(std::same_as<type_list::front_t<PoppedFront>, Snd>);

using Pushed = type_list::push_front_t<Trd, PoppedFront>;
static_assert(type_list::size_v<Pushed> == 3);
static_assert(std::same_as<type_list::front_t<Pushed>, Trd>);

auto main() -> int {
    return 0;
}
