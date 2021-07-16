using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;
using UnityEngine.XR.ARKit;
public class ImgTrackHierarchy : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;

    public ARTrackedImageManager _ARTImgMng;

    //���2
    private Dictionary<string, GameObject> _DicObject2 = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetList2FromHierarchy;

    public GameObject focusGridCanvas;
    //public ParticleSystem trackParticles;

    private void Awake()
    {
        focusGridCanvas.SetActive(true);
        //trackParticles.Stop();

        Debug.Log("Awake");
        for (int i = 0; i < _TargetList2FromHierarchy.Count; i++)
        {
            _DicObject2.Add(_TargetList2FromHierarchy[i].name, _TargetList2FromHierarchy[i]);
        }
        Debug.Log(_ARTImgMng);

    }

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
        //myLog = GUI.TextArea(new Rect(500, 0, 100, 100), debugLog);
    }

    void UpdateImg(ARTrackedImage img)
    {
        //trackParticles.Play();
        focusGridCanvas.SetActive(false);

        // METHOD 2: deactivate all prefabs, only activate according Prefab

        // ONLY TRUE for current Tracked Image Prefab
        // NEED to Rotate x transform:-90 or 90 for Scene3Media, Scene4Play, Scene6Monster
        // STAY same for Scene2Book, Scene5Drink
        if (_DicObject2.ContainsKey(img.referenceImage.name)) {

            string currPrefabName = img.referenceImage.name;
           if (!_DicObject2[currPrefabName].activeSelf) {
                
                debugLog = currPrefabName;

                if ((currPrefabName == "scene3Media") || (currPrefabName == "scene4Play") || (currPrefabName == "scene6Monster"))
                {
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    _DicObject2[currPrefabName].transform.position = img.transform.position;
                    _DicObject2[currPrefabName].transform.rotation = rotation;

                }
                
                _DicObject2[currPrefabName].SetActive(true);

                // _DicObject2[img.referenceImage.name].transform.position = img.transform.position;
                // _DicObject2[img.referenceImage.name].transform.rotation = img.transform.rotation;
            }
        } 
    }
}
