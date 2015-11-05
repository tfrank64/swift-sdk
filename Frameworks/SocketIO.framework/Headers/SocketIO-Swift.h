// Generated by Apple Swift version 2.1 (swiftlang-700.1.101.6 clang-700.1.76)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import ObjectiveC;
@import Foundation;
@import Dispatch;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

SWIFT_CLASS("_TtC8SocketIO16SocketAckEmitter")
@interface SocketAckEmitter : NSObject
- (void)with:(NSArray * __nonnull)items;
@end

@class NSArray;

SWIFT_CLASS("_TtC8SocketIO14SocketAnyEvent")
@interface SocketAnyEvent : NSObject
@property (nonatomic, readonly, copy) NSString * __null_unspecified event;
@property (nonatomic, readonly, strong) NSArray * __nullable items;
@property (nonatomic, readonly, copy) NSString * __nonnull description;
@end

@protocol SocketEngineClient;
@class NSHTTPCookie;
@class NSDictionary;
@class NSData;
enum SocketEnginePacketType : NSInteger;

SWIFT_PROTOCOL("_TtP8SocketIO16SocketEngineSpec_")
@protocol SocketEngineSpec
@property (nonatomic, weak) id <SocketEngineClient> __nullable client;
@property (nonatomic, readonly, copy) NSArray<NSHTTPCookie *> * __nullable cookies;
@property (nonatomic, readonly, copy) NSString * __nonnull sid;
@property (nonatomic, readonly, copy) NSString * __nonnull socketPath;
@property (nonatomic, readonly, copy) NSString * __nonnull urlPolling;
@property (nonatomic, readonly, copy) NSString * __nonnull urlWebSocket;
- (nonnull instancetype)initWithClient:(id <SocketEngineClient> __nonnull)client url:(NSString * __nonnull)url options:(NSDictionary * __nullable)options;
- (void)close;
- (void)open:(NSDictionary<NSString *, id> * __nullable)opts;
- (void)send:(NSString * __nonnull)msg withData:(NSArray<NSData *> * __nullable)datas;
- (void)write:(NSString * __nonnull)msg withType:(enum SocketEnginePacketType)type withData:(NSArray<NSData *> * __nullable)data;
@end

@class WebSocket;

SWIFT_CLASS("_TtC8SocketIO12SocketEngine")
@interface SocketEngine : NSObject <SocketEngineSpec>
@property (nonatomic, readonly, copy) NSString * __nonnull sid;
@property (nonatomic, readonly, copy) NSArray<NSHTTPCookie *> * __nullable cookies;
@property (nonatomic, readonly, copy) NSString * __nonnull socketPath;
@property (nonatomic, readonly, copy) NSString * __nonnull urlPolling;
@property (nonatomic, readonly, copy) NSString * __nonnull urlWebSocket;
@property (nonatomic, readonly, strong) WebSocket * __nullable ws;
@property (nonatomic, weak) id <SocketEngineClient> __nullable client;
- (nonnull instancetype)initWithClient:(id <SocketEngineClient> __nonnull)client url:(NSString * __nonnull)url options:(NSDictionary * __nullable)options;
- (void)close;
- (void)open:(NSDictionary<NSString *, id> * __nullable)opts;

/// Send an engine message (4)
- (void)send:(NSString * __nonnull)msg withData:(NSArray<NSData *> * __nullable)datas;

/// Write a message, independent of transport.
- (void)write:(NSString * __nonnull)msg withType:(enum SocketEnginePacketType)type withData:(NSArray<NSData *> * __nullable)data;
@end

@class NSError;

@interface SocketEngine (SWIFT_EXTENSION(SocketIO))
- (void)websocketDidConnect:(WebSocket * __nonnull)socket;
- (void)websocketDidDisconnect:(WebSocket * __nonnull)socket error:(NSError * __nullable)error;
- (void)websocketDidReceiveMessage:(WebSocket * __nonnull)socket text:(NSString * __nonnull)text;
- (void)websocketDidReceiveData:(WebSocket * __nonnull)socket data:(NSData * __nonnull)data;
@end


@interface SocketEngine (SWIFT_EXTENSION(SocketIO))
@end


SWIFT_PROTOCOL("_TtP8SocketIO18SocketEngineClient_")
@protocol SocketEngineClient
- (void)didError:(id __nonnull)reason;
- (void)engineDidClose:(NSString * __nonnull)reason;
- (void)parseSocketMessage:(NSString * __nonnull)msg;
- (void)parseBinaryData:(NSData * __nonnull)data;
@end

typedef SWIFT_ENUM(NSInteger, SocketEnginePacketType) {
  SocketEnginePacketTypeOpen = 0,
  SocketEnginePacketTypeClose = 1,
  SocketEnginePacketTypePing = 2,
  SocketEnginePacketTypePong = 3,
  SocketEnginePacketTypeMessage = 4,
  SocketEnginePacketTypeUpgrade = 5,
  SocketEnginePacketTypeNoop = 6,
};


enum SocketIOClientStatus : NSInteger;

SWIFT_CLASS("_TtC8SocketIO14SocketIOClient")
@interface SocketIOClient : NSObject <SocketEngineClient>
@property (nonatomic, readonly, copy) NSString * __nonnull socketURL;
@property (nonatomic, readonly, strong) id <SocketEngineSpec> __nullable engine;
@property (nonatomic, readonly) BOOL secure;
@property (nonatomic, readonly) enum SocketIOClientStatus status;
@property (nonatomic, copy) NSString * __nonnull nsp;
@property (nonatomic) BOOL reconnects;
@property (nonatomic) NSInteger reconnectWait;
@property (nonatomic, readonly, copy) NSString * __nullable sid;

/// Not so type safe way to create a SocketIOClient, meant for Objective-C compatiblity. If using Swift it's recommended to use init(var socketURL: String, opts: SocketOptionsDictionary? = nil)
- (nonnull instancetype)initWithSocketURL:(NSString * __nonnull)socketURL options:(NSDictionary * __nullable)options;

/// Closes the socket. Only reopen the same socket if you know what you're doing. Will turn off automatic reconnects. Pass true to fast if you're closing from a background task
- (void)close;

/// Connect to the server.
- (void)connect;

/// Connect to the server. If we aren't connected after timeoutAfter, call handler
- (void)connectWithTimeoutAfter:(NSInteger)timeoutAfter withTimeoutHandler:(void (^ __nullable)(void))handler;

/// error
- (void)didError:(id __nonnull)reason;

/// Same as close
- (void)disconnect;

/// Same as emit, but meant for Objective-C
- (void)emit:(NSString * __nonnull)event withItems:(NSArray * __nonnull)items;

/// Same as emitWithAck, but for Objective-C
- (void (^ __nonnull)(uint64_t, void (^ __nonnull)(NSArray * __nonnull)))emitWithAck:(NSString * __nonnull)event withItems:(NSArray * __nonnull)items;
- (void)engineDidClose:(NSString * __nonnull)reason;

/// Leaves nsp and goes back to /
- (void)leaveNamespace;

/// Joins nsp if it is not /
- (void)joinNamespace;

/// Joins namespace /
- (void)joinNamespace:(NSString * __nonnull)namespace_;

/// Removes handler(s)
- (void)off:(NSString * __nonnull)event;

/// Adds a handler for an event.
- (void)on:(NSString * __nonnull)event callback:(void (^ __nonnull)(NSArray * __nonnull, SocketAckEmitter * __nullable))callback;

/// Adds a single-use handler for an event.
- (void)once:(NSString * __nonnull)event callback:(void (^ __nonnull)(NSArray * __nonnull, SocketAckEmitter * __nullable))callback;

/// Removes all handlers. Can be used after disconnecting to break any potential remaining retain cycles.
- (void)removeAllHandlers;

/// Adds a handler that will be called on every event.
- (void)onAny:(void (^ __nonnull)(SocketAnyEvent * __nonnull))handler;

/// Same as connect
- (void)open;
- (void)parseSocketMessage:(NSString * __nonnull)msg;
- (void)parseBinaryData:(NSData * __nonnull)data;

/// Tries to reconnect to the server.
- (void)reconnect;
@end


@interface SocketIOClient (SWIFT_EXTENSION(SocketIO))
@end

typedef SWIFT_ENUM(NSInteger, SocketIOClientStatus) {
  SocketIOClientStatusNotConnected = 0,
  SocketIOClientStatusClosed = 1,
  SocketIOClientStatusConnecting = 2,
  SocketIOClientStatusConnected = 3,
  SocketIOClientStatusReconnecting = 4,
};

@class NSURL;
@class NSStream;

SWIFT_CLASS("_TtC8SocketIO9WebSocket")
@interface WebSocket : NSObject <NSStreamDelegate>
@property (nonatomic, strong) dispatch_queue_t __null_unspecified queue;
@property (nonatomic, copy) void (^ __nullable onConnect)(void);
@property (nonatomic, copy) void (^ __nullable onDisconnect)(NSError * __nullable);
@property (nonatomic, copy) void (^ __nullable onText)(NSString * __nonnull);
@property (nonatomic, copy) void (^ __nullable onData)(NSData * __nonnull);
@property (nonatomic, copy) void (^ __nullable onPong)(void);
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> * __nonnull headers;
@property (nonatomic) BOOL voipEnabled;
@property (nonatomic) BOOL selfSignedSSL;
@property (nonatomic, readonly) BOOL isConnected;
- (nonnull instancetype)initWithUrl:(NSURL * __nonnull)url OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithUrl:(NSURL * __nonnull)url protocols:(NSArray<NSString *> * __nonnull)protocols;

/// Connect to the websocket server on a background thread
- (void)connect;

/// disconnect from the websocket server
- (void)disconnect;

/// write a string to the websocket. This sends it as a text frame.
- (void)writeString:(NSString * __nonnull)str;

/// write binary data to the websocket. This sends it as a binary frame.
- (void)writeData:(NSData * __nonnull)data;
- (void)writePing:(NSData * __nonnull)data;
- (void)stream:(NSStream * __nonnull)aStream handleEvent:(NSStreamEvent)eventCode;
@end

#pragma clang diagnostic pop
