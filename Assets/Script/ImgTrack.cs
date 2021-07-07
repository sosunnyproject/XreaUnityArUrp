using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class ImgTrack : MonoBehaviour
{

    bool isLoaded = false;

    public ARTrackedImageManager _ARTImgMng;

    //방법1
    private Dictionary<string, GameObject> _DicObject = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetList;

    //방법2
    private Dictionary<string, GameObject> _DicObject2 = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetList2;


    private void Awake()
    {
        Debug.Log("Awake");
        //방법2
        for (int i = 0; i < _TargetList2.Count; i++) {
            _DicObject2.Add(_TargetList2[i].name, _TargetList2[i]);
        }
        Debug.Log(_ARTImgMng);
        //Debug.Log(_TargetList);
        //Debug.Log(_TargetList2);

        //StartCoroutine(co_LoadDelay());
    }

    //IEnumerator co_LoadDelay()
    //{
    //    yield return null;

    //    while(true)
    //    {
    //        _ARTImgMng.
    //    }
    //}

    private void OnEnable() {
        //이미지트래킹 이벤트 등록.image tracking event register
        _ARTImgMng.trackedImagesChanged += ImageTracked;
    }

    private void OnDisable() {
        //이미지트래킹 이벤트 해제.image tracking event unload
        _ARTImgMng.trackedImagesChanged -= ImageTracked;
    }

    void ImageTracked(ARTrackedImagesChangedEventArgs eventArgs) {
        foreach(ARTrackedImage artImg in eventArgs.added) {
            UpdateImg(artImg);
        }

        foreach (ARTrackedImage artImg in eventArgs.updated) {
            UpdateImg(artImg);
        }
    }

    void UpdateImg(ARTrackedImage img) {
        Debug.Log("UpdateImg");
        Debug.Log(img);
        //method 1: appear Prefab according to the image
        if (_DicObject.ContainsKey(img.referenceImage.name)) {

        }
        // if targeted Obj, show the object
        else {

            GameObject target = null;

            for (int i = 0; i < _TargetList.Count; i++)
            {
                if (img.referenceImage.name == _TargetList[i].name)
                {
                    target = _TargetList[i];
                    break;
                }
            }
            if (target != null)
            {
                // rotate x:90 degree because current marker is rotated in the scene
                Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                GameObject Obj = Instantiate(target, img.transform.position, rotation);
                _DicObject.Add(img.referenceImage.name, Obj);
            }
        }
        // remove method needed


        //// method 2: deactivate all prefabs, only activate according Prefab
        //if (_DicObject2.ContainsKey(img.referenceImage.name)) {

        //    if (!_DicObject2[img.referenceImage.name].activeSelf) {
        //        _DicObject2[img.referenceImage.name].SetActive(true);
        //        // _DicObject2[img.referenceImage.name].transform.position = img.transform.position;
        //        // _DicObject2[img.referenceImage.name].transform.rotation = img.transform.rotation;
        //    }
        //}
    }
}
