using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class ImgTrackHierarchyBm : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;

    bool isLoaded = false;

    public ARTrackedImageManager _ARTImgMng;

    //¹æ¹ý2
    private Dictionary<string, GameObject> _DicObject2 = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetList2FromHierarchy;


    private void Awake()
    {
        Debug.Log("Awake");
        for (int i = 0; i < _TargetList2FromHierarchy.Count; i++)
        {
            _DicObject2.Add(_TargetList2FromHierarchy[i].name, _TargetList2FromHierarchy[i]);
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

    private void OnEnable()
    {
        // register image tracking event 
        _ARTImgMng.trackedImagesChanged += ImageTracked;
        Debug.Log("ENABLED");
        debugLog = "ENABLED";
    }

    private void OnDisable()
    {
        // unload image tracking event 
        _ARTImgMng.trackedImagesChanged -= ImageTracked;
        Debug.Log("DISALBED");
        debugLog = "DISABLED";
    }

    void ImageTracked(ARTrackedImagesChangedEventArgs eventArgs)
    {

        foreach (ARTrackedImage artImg in eventArgs.added)
        {
            UpdateImg(artImg);
        }

        foreach (ARTrackedImage artImg in eventArgs.updated)
        {
            UpdateImg(artImg);
        }
    }

    public void ResetBtnClicked()
    {
        OnDisable();
    }

    void OnGUI()
    {
        myLog = GUI.TextArea(new Rect(500, 0, 100, 100), debugLog);
    }

    void UpdateImg(ARTrackedImage img)
    {

        // METHOD 2: deactivate all prefabs, only activate according Prefab
        // ???? : NEED to SetActive(false) for all the other prefabs.

        // ONLY TRUE for current Tracked Image Prefab
        // NEED to Rotate x transform:-90 or 90 for Scene3Media, Scene4Play, Scene6Monster
        // STAY same for Scene2Book, Scene5Drink

        foreach (var obj in _DicObject2) {
            obj.Value.SetActive(false);
        }

        if (_DicObject2.ContainsKey(img.referenceImage.name)) {

           if (!_DicObject2[img.referenceImage.name].activeSelf) {
                _DicObject2[img.referenceImage.name].SetActive(true);
                // _DicObject2[img.referenceImage.name].transform.position = img.transform.position;
                // _DicObject2[img.referenceImage.name].transform.rotation = img.transform.rotation;
            }
        } 
    }
}
