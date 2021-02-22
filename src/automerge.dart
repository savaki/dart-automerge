import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;
import 'dart:convert' show utf8;

class Backend extends Opaque {}

typedef _automerge_apply_changes = IntPtr Function(Pointer<Backend>);
typedef AutomergeApplyChanges = int Function(Pointer<Backend>);

typedef _automerge_apply_local_change = IntPtr Function(
    Pointer<Backend>, Pointer<Utf8>);
typedef AutomergeApplyLocalChange = int Function(
    Pointer<Backend>, Pointer<Utf8>);

typedef _automerge_clone = Pointer<Backend> Function(Pointer<Backend>);
typedef AutomergeClone = Pointer<Backend> Function(Pointer<Backend>);

typedef _automerge_decode_change = IntPtr Function(
    Pointer<Backend>, IntPtr, Pointer<Uint8>);
typedef AutomergeDecodeChange = int Function(
    Pointer<Backend>, int, Pointer<Uint8>);

typedef _automerge_encode_change = IntPtr Function(
    Pointer<Backend>, Pointer<Uint8>);
typedef AutomergeEncodeChange = int Function(Pointer<Backend>, Pointer<Uint8>);

typedef _automerge_error = Pointer<Utf8> Function(Pointer<Backend>);
typedef AutomergeError = Pointer<Utf8> Function(Pointer<Backend>);

typedef _automerge_free = Void Function(Pointer<Backend>);
typedef AutomergeFree = void Function(Pointer<Backend>);

typedef _automerge_get_changes_for_actor = IntPtr Function(
    Pointer<Backend>, Pointer<Utf8>);
typedef AutomergeGetChangesForActor = int Function(
    Pointer<Backend>, Pointer<Utf8>);

typedef _automerge_get_heads = IntPtr Function(Pointer<Backend>);
typedef AutomergeGetHeads = int Function(Pointer<Backend>);

typedef _automerge_get_last_local_change = IntPtr Function(Pointer<Backend>);
typedef AutomergeGetLastLocalChange = int Function(Pointer<Backend>);

typedef _automerge_get_missing_deps = IntPtr Function(Pointer<Backend>);
typedef AutomergeGetMissingDeps = int Function(Pointer<Backend>);

typedef _automerge_get_patch = IntPtr Function(Pointer<Backend>);
typedef AutomergeGetPatch = int Function(Pointer<Backend>);

typedef _automerge_init = Pointer<Backend> Function();
typedef AutomergeInit = Pointer<Backend> Function();

typedef _automerge_load = Pointer<Backend> Function(IntPtr, Pointer<Uint8>);
typedef AutomergeLoad = Pointer<Backend> Function(int, Pointer<Uint8>);

typedef _automerge_load_changes = IntPtr Function(Pointer<Backend>);
typedef AutomergeLoadChanges = int Function(Pointer<Backend>);

typedef _automerge_read_binary = IntPtr Function(
    Pointer<Backend>, Pointer<Uint8>);
typedef AutomergeReadBinary = int Function(Pointer<Backend>, Pointer<Uint8>);

typedef _automerge_read_json = IntPtr Function(
    Pointer<Backend>, Pointer<Uint8>);
typedef AutomergeReadJSON = int Function(Pointer<Backend>, Pointer<Uint8>);

typedef _automerge_save = IntPtr Function(Pointer<Backend>);
typedef AutomergeSave = int Function(Pointer<Backend>);

typedef _automerge_write_change = Void Function(
    Pointer<Backend>, IntPtr, Pointer<Uint8>);
typedef AutomergeWriteChange = void Function(
    Pointer<Backend>, int, Pointer<Uint8>);

class Automerge {
  late final AutomergeApplyChanges applyChanges;
  late final AutomergeApplyLocalChange applyLocalChange;
  late final AutomergeClone clone;
  late final AutomergeDecodeChange decodeChange;
  late final AutomergeEncodeChange encodeChange;
  late final AutomergeError error;
  late final AutomergeFree free;
  late final AutomergeGetChangesForActor getChangesForActor;
  late final AutomergeGetHeads getHeads;
  late final AutomergeGetMissingDeps getMissingDeps;
  late final AutomergeGetPatch getPatch;
  late final AutomergeGetLastLocalChange getLastLocalChange;
  late final AutomergeInit init;
  late final AutomergeLoad load;
  late final AutomergeLoadChanges loadChanges;
  late final AutomergeReadBinary readBinary;
  late final AutomergeReadJSON readJSON;
  late final AutomergeSave save;
  late final AutomergeWriteChange writeChange;

  Automerge({DynamicLibrary? lib}) {
    DynamicLibrary dylib = lib ?? loadLibrary();

    applyChanges = dylib
        .lookup<NativeFunction<_automerge_apply_changes>>(
            'automerge_apply_changes')
        .asFunction();

    applyLocalChange = dylib
        .lookup<NativeFunction<_automerge_apply_local_change>>(
            'automerge_apply_local_change')
        .asFunction();

    clone = dylib
        .lookup<NativeFunction<_automerge_clone>>('automerge_clone')
        .asFunction();

    decodeChange = dylib
        .lookup<NativeFunction<_automerge_decode_change>>(
            'automerge_decode_change')
        .asFunction();

    encodeChange = dylib
        .lookup<NativeFunction<_automerge_encode_change>>(
            'automerge_encode_change')
        .asFunction();

    error = dylib
        .lookup<NativeFunction<_automerge_error>>('automerge_error')
        .asFunction();

    free = dylib
        .lookup<NativeFunction<_automerge_free>>('automerge_free')
        .asFunction();

    getChangesForActor = dylib
        .lookup<NativeFunction<_automerge_get_changes_for_actor>>(
            'automerge_get_changes_for_actor')
        .asFunction();

    getHeads = dylib
        .lookup<NativeFunction<_automerge_get_heads>>('automerge_get_heads')
        .asFunction();

    getLastLocalChange = dylib
        .lookup<NativeFunction<_automerge_get_last_local_change>>(
            'automerge_get_last_local_change')
        .asFunction();

    getMissingDeps = dylib
        .lookup<NativeFunction<_automerge_get_missing_deps>>(
            'automerge_get_missing_deps')
        .asFunction();

    getPatch = dylib
        .lookup<NativeFunction<_automerge_get_patch>>('automerge_get_patch')
        .asFunction();

    init = dylib
        .lookup<NativeFunction<_automerge_init>>('automerge_init')
        .asFunction();

    load = dylib
        .lookup<NativeFunction<_automerge_load>>('automerge_load')
        .asFunction();

    loadChanges = dylib
        .lookup<NativeFunction<_automerge_load_changes>>(
            'automerge_load_changes')
        .asFunction();

    readBinary = dylib
        .lookup<NativeFunction<_automerge_read_binary>>('automerge_read_binary')
        .asFunction();

    readJSON = dylib
        .lookup<NativeFunction<_automerge_read_json>>('automerge_read_json')
        .asFunction();

    save = dylib
        .lookup<NativeFunction<_automerge_save>>('automerge_save')
        .asFunction();

    writeChange = dylib
        .lookup<NativeFunction<_automerge_write_change>>(
            'automerge_write_change')
        .asFunction();
  }

  DynamicLibrary loadLibrary() {
    final libraryPath =
        path.join(Directory.current.path, '', 'libautomerge.dylib');

    return DynamicLibrary.open(libraryPath);
  }
}

main() {
  final automerge = Automerge();

  final a1 =
      '{"actor":"111111","seq":1,"time":0,"deps":[],"startOp":1,"ops":[{"action":"set","obj":"_root","key":"bird","value":"magpie","pred":[]}]}';
  final a2 =
      '{"actor":"111111","seq":2,"time":0,"deps":[],"startOp":2,"ops":[{"action":"set","obj":"_root","key":"dog","value":"mastiff","pred":[]}]}';
  final b1 =
      '{"actor":"222222","seq":1,"time":0,"deps":[],"startOp":1,"ops":[{"action":"set","obj":"_root","key":"bird","value":"crow","pred":[]}]}';
  final b2 =
      '{"actor":"222222","seq":2,"time":0,"deps":[],"startOp":2,"ops":[{"action":"set","obj":"_root","key":"cat","value":"tabby","pred":[]}]}';

  const buffSize = 4096;
  final buff = malloc<Uint8>(buffSize);
  final buff2 = malloc<Uint8>(buffSize);
  final buff3 = malloc<Uint8>(buffSize);

  final dbA = automerge.init();
  final dbB = automerge.init();

  print("*** requestA1 ***\n\n${a1}\n");

  {
    final len = automerge.getLastLocalChange(dbA);
    assert(len == -1);
    final err = automerge.error(dbA);
    print("*** last_local expected error string ** (${err.toDartString()})\n");
  }

  {
    final len = automerge.applyLocalChange(dbA, a1.toNativeUtf8());
    assert(len < buffSize);
    final code = automerge.readJSON(dbA, buff);
    assert(code == 0);
    final s = utf8.decode(buff.asTypedList(len - 1));
    print("*** patchA1 ***\n\n${s}\n");
  }

  {
    final len = automerge.getLastLocalChange(dbA);
    assert(len > 0);
    assert(len < buffSize);
    final code = automerge.readBinary(dbA, buff);
    assert(code == 0);
  }

  {
    final len = automerge.applyLocalChange(dbA, "{}".toNativeUtf8());
    assert(len == -1);
    final err = automerge.error(dbA);
    print("*** patchA2 expected error string ** (${err.toDartString()})\n");
  }

  {
    final len = automerge.applyLocalChange(dbA, a2.toNativeUtf8());
    assert(len < buffSize);
    final code = automerge.readJSON(dbA, buff);
    assert(code == 0);
    var s = utf8.decode(buff.asTypedList(len - 1));
    print("*** patchA2 ***\n\n${s}\n");
  }

  {
    final len = automerge.applyLocalChange(dbB, b1.toNativeUtf8());
    assert(len < buffSize);
    final code = automerge.readJSON(dbB, buff);
    assert(code == 0);
    var s = utf8.decode(buff.asTypedList(len - 1));
    print("*** patchB1 ***\n\n${s}\n");
  }

  {
    final len = automerge.applyLocalChange(dbB, b2.toNativeUtf8());
    assert(len < buffSize);
    final code = automerge.readJSON(dbB, buff);
    assert(code == 0);
    var s = utf8.decode(buff.asTypedList(len - 1));
    print("*** patchB2 ***\n\n${s}\n");
  }

  print("*** clone dbA -> dbC ***\n");
  final dbC = automerge.clone(dbA);

  {
    final lenA = automerge.getPatch(dbA);
    assert(lenA < buffSize);
    final codeA = automerge.readJSON(dbA, buff);
    assert(codeA == 0);

    final lenC = automerge.getPatch(dbC);
    assert(lenC <= buffSize);
    final codeC = automerge.readJSON(dbC, buff2);
    assert(codeC == 0);

    print("*** get_patch of dbA & dbC -- equal? *** --> ${codeA == codeC}\n");
    assert(codeA == codeC);
  }

  Pointer<Backend> dbD;
  {
    final len = automerge.save(dbA);
    assert(len <= buffSize);
    final code = automerge.readBinary(dbA, buff2);
    assert(code == 0);
    print("*** save dbA - ${len} bytes ***\n");

    final lenA = automerge.getPatch(dbA);
    assert(lenA <= buffSize);

    print("*** load the save into dbD ***\n");
    dbD = automerge.load(len, buff2);
    final lenD = automerge.getPatch(dbD);
    assert(lenD <= buffSize);
    final codeD = automerge.readJSON(dbD, buff2);
    assert(codeD == 0);

    print("*** get_patch of dbA & dbD -- equal? *** --> ${lenA == lenD}\n");
    assert(lenA == lenD);
  }

  {
    print("*** copy changes from dbA to B ***\n");
    int len = automerge.getChangesForActor(dbA, "111111".toNativeUtf8());
    print('getChangesForActor -> ${len}');
    while (len > 0) {
      assert(len <= buffSize);
      final nextLen = automerge.readBinary(dbA, buff);
      print('readBinary -> ${nextLen}');
      automerge.writeChange(dbB, len, buff);

      final decodeLen = automerge.decodeChange(dbB, len, buff);
      print('decodeLen->${decodeLen}');
      final code = automerge.readJSON(dbA, buff2);
      assert(code == 0);
      final s = utf8.decode(buff2.asTypedList(decodeLen - 1));
      print("Change decoded to json -- ${s}");

      automerge.encodeChange(dbB, buff2);
      final codeB = automerge.readBinary(dbB, buff3);
      assert(codeB == 0);

      len = nextLen;
    }

    {
      final code = automerge.applyChanges(dbB);
      assert(code == 0);
    }
    // printf("*** load the save into dbD ***\n\n");
    // Backend * dbD = automerge_load(len, buff2);
    // len = automerge_get_patch(dbD);
    // assert(len <= BUFSIZE);
    // automerge_read_json(dbD, buff2);
    // printf("*** get_patch of dbA & dbD -- equal? *** --> %s\n\n",strlen(buff) == strlen(buff2) ? "true" : "false");
    // assert(strlen(buff) == strlen(buff2));

  }

  automerge.free(dbA);
  automerge.free(dbB);
  automerge.free(dbC);
}
