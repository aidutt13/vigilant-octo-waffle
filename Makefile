CXX := clang++
CXXFLAGS :=-Wall -std=c++20

LIBS :=-lX11 -lGL -lpthread -lpng -lstdc++fs

TARGET := pgeapp

INCDIR := inc
SRCDIR := src
BUILDDIR := build

all: build $(TARGET)

SRC := \
	$(wildcard $(SRCDIR)/*.cpp)

OBJ := \
	$(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SRC))

DEPENDENCIES := \
	$(OBJECTS:.o=.d)

$(OBJ): $(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@echo Building $@ from $<
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -I./$(INCDIR) -MMD -c -o $@ $<

$(TARGET): $(OBJ)
	$(CXX) $(CFLAGS) $(LIBS) -o $@ $^

-include $(DEPENDENCIES)

.PHONY: all build clean debug release

build:
	@mkdir -p $(BUILDDIR)

debug: CXXFLAGS += -DDEBUG -g
debug: all

release: CXXFLAGS += -O2
release: all

clean:
	-@rm -rvf $(BUILDDIR)/*.o $(TARGET)
